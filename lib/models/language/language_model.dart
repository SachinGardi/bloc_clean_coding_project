import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  marathi(
    Locale('mr', 'IND'),
    'Marathi',
  );

  const Language(
      this.value,
      this.text,
      );

  final Locale value;
  final String text;
}