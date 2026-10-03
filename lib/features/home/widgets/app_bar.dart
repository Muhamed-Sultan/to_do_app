import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/login/data/user_model.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Hive.box<UserModel>(
      AppConstant.userBox,
    ).get(AppConstant.currentUser);
    return Row(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: Image.file(File(user?.image ?? "")).image,
        ),
        20.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.good_morning.tr()),
              Text(user?.name ?? ""),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            if (context.locale == const Locale('en')) {
              context.setLocale(const Locale('ar'));
            } else {
              context.setLocale(const Locale('en'));
            }
          },
          icon: Icon(Icons.language_outlined),
        ),
      ],
    );
  }
}
