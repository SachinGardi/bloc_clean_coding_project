import 'package:bloc_clean_coding_project/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding_project/main.dart';
import 'package:bloc_clean_coding_project/models/language/language_model.dart';
import 'package:bloc_clean_coding_project/views/login/widgets/languageButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc(loginRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map isSelected = {
      Language.marathi.text: AppLocalizations.of(context)!.localeName == 'el',
      Language.english.text: AppLocalizations.of(context)!.localeName == 'en',
    };

    void toggleLanguage(String lang) {
      if (isSelected[lang]) return;

      isSelected.forEach((key, value) {
        setState(() {
          isSelected[key] = !value;
        });
      });

      BlocProvider.of<LoginBloc>(context).add(
        ChangeLanguage(
          selectedLanguage:
          lang == 'Marathi' ? Language.marathi : Language.english,
        ),
      );
    }
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: const Text('Login'),
          centerTitle: true,
          actions: [
            BlocBuilder<LoginBloc, LoginStates>(
              builder: (context, state) {


             return LanguageButton(
                 context: context,
               function: toggleLanguage,
               text: Language.english.text,
               isActive: isSelected[Language.english.text],
             );
              },
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailInputWidget(emailFocusNode: emailFocusNode),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                  const SizedBox(
                    height: 50,
                  ),
                  LoginButton(
                    formKey: _formKey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
