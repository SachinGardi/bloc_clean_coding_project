import 'package:bloc_clean_coding_project/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration:  InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              helperText: AppLocalizations.of(context)!.passwordShouldbeatleast_characterswithatleastoneletterandnumber, // Helper text for password input field
              helperMaxLines: 2,
              labelText: AppLocalizations.of(context)!.password, // Label text for password input field
              hintText: 'Please Enter password',
              border: const OutlineInputBorder(),
              errorMaxLines: 2
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChange(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            else if (value.length < 6) {
              return 'password should be at least 6 character';
            }
            return null;
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
