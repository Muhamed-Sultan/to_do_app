import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ToDoApp(),
    ),
  );
}
