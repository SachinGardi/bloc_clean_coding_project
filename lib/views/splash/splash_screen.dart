import 'package:bloc_clean_coding_project/services/splash/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    _splashServices.isLogin(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(AppLocalizations.of(context)!.splashScreen,style: Theme.of(context).textTheme.displayMedium
          ))
        ),

    );
  }
}
