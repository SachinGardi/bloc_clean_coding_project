import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper{

  static void flushBarErrorMessage(String message ,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve:  Curves.decelerate,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: const EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 28,color: Colors.white,),
        )..show(context));
  }
  static void flushBarSuccessMessage(String message,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve:  Curves.decelerate,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: const EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.green,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.check_circle_rounded,size: 28,color: Colors.white,),
        )..show(context));
  }
}