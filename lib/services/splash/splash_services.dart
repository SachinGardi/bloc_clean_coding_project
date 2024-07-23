import 'dart:async';
import 'package:bloc_clean_coding_project/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

import '../../config/routes/routes.dart';

class SplashServices{


  void isLogin(BuildContext context){

    SessionController().getUserFromPreference().then((value){
      if(SessionController().isLogin ?? false){
        Timer(const Duration(seconds: 3), () =>Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false));
      }
      else{
        Timer(const Duration(seconds: 3), () =>Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false));

      }
    }).onError((error, stackTrace){
      Timer(const Duration(seconds: 3), () =>Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false));

    });
  }
}