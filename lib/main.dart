import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/to_do_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/features/login/data/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(AppConstant.userBox);
  await Hive.openBox<TaskModel>(AppConstant.tasksBox);

  Hive.box<TaskModel>(AppConstant.tasksBox).clear();

  runApp(
    EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ToDoApp(),
    ),
  );
}
