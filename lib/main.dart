import 'package:bloc_clean_coding_project/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_clean_coding_project/config/routes/routes_name.dart';
import 'package:bloc_clean_coding_project/config/themes/dark_theme.dart';
import 'package:bloc_clean_coding_project/config/themes/light_theme.dart';
import 'package:bloc_clean_coding_project/repository/auth/login_http_api_repository.dart';
import 'package:bloc_clean_coding_project/repository/auth/login_api_repository.dart';
import 'package:bloc_clean_coding_project/repository/movies/movies_http_api_repository.dart';
import 'package:bloc_clean_coding_project/repository/movies/movies_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'config/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GetIt getIt = GetIt.instance;
var local = const Locale('en', '');

void main() {
  serviceLocator();
  runApp(BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(loginRepository: getIt()),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: lightTheme,
          darkTheme: darkTheme,
          locale: state.selectedLanguage.value,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('mr', ''),
          ],
          onGenerateRoute: RoutesName.getRoutes,
          initialRoute: Routes.splashScreen,
        );
      },
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
  getIt.registerLazySingleton<MoviesRepository>(() =>
      MoviesHttpApiRepository());
}


