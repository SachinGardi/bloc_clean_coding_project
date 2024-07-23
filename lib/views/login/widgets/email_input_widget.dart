import 'package:bloc_clean_coding_project/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding_project/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration:  InputDecoration(
              prefixIcon: const Icon(Icons.email),
              labelText: AppLocalizations.of(context)!.email,
              helperText: AppLocalizations.of(context)!.aCompleteValidEmailExamplejoegmailcom, // Helper text for email input field
              hintText: 'Please Enter email',
              border: const OutlineInputBorder()
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChange(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter Email';
            }
            if(!Validations.emailValidator(value)){
              return 'Email is invalid';
            }
            return null;
          },
          textInputAction: TextInputAction.next,

        );
      },
    );
  }
}
