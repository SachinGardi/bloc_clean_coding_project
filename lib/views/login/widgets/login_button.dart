import 'package:bloc_clean_coding_project/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding_project/utils/enums.dart';
import 'package:bloc_clean_coding_project/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/routes.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {

        if(state.postApiStatus == PostApiStatus.error){
          FlushBarHelper.flushBarErrorMessage(state.message.toString(),context);
        }
        if(state.postApiStatus == PostApiStatus.success){
          Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen,(route) => false);
          FlushBarHelper.flushBarSuccessMessage('Login Successful',context);
        }

      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(onPressed: () {
            if (formKey.currentState!.validate()) {
             context.read<LoginBloc>().add(Login());
            }
          }, child: state.postApiStatus == PostApiStatus.loading?const CircularProgressIndicator():const Text('Login'));
        },
      ),
    );
  }
}
