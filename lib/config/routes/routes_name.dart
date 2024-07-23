import 'package:bloc_clean_coding_project/config/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../views/view.dart';


class RoutesName{
  
  static Route<dynamic> getRoutes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashScreen:
       return MaterialPageRoute(builder: (_) => const SplashScreen(),);

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),);

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen(),);

      default:undefinedRoute();
    }
    return undefinedRoute();
  }

  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (_) => const Scaffold(
    body: Center(
      child: Text('No Route Generated'),
    ),
    ),);
  }
  
}