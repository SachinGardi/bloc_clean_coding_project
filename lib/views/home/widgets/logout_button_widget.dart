import 'package:flutter/material.dart';
import '../../../config/routes/routes.dart';
import '../../../services/storage/local_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LocalStorage localStorage = LocalStorage();
        localStorage.clearValue('token').then((value) {
          localStorage.clearValue('isLogin');
          Navigator.pushNamed(context, Routes.loginScreen); // Navigating to the login screen after clearing token and isLogin value
        });
      },
      child: Center(
        child: Text(
          AppLocalizations.of(context)!.logout, // Localized text for logout button
        ),
      ),
    );
  }
}