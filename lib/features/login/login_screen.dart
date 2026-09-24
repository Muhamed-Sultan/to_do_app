import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f7fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xffe8ecf5),
                  child: Icon(Icons.person, color: Colors.blue, size: 32),
                ),
              ),
              15.verticalSpace,
              Center(
                child: Text(
                  'create_profile'.tr(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1b1b21),
                  ),
                ),
              ),
              5.verticalSpace,
              Center(
                child: Text(
                  'add_name_picture'.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff858891),
                  ),
                ),
              ),
              15.verticalSpace,
              Text(
                'full_name'.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1b1b21),
                ),
              ),
              5.verticalSpace,
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'name_hint'.tr(),
                ),
              ),
              20.verticalSpace,
              Center(
                child: SizedBox(
                  width: 230.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('continueButton'.tr()),
                  ),
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
                icon: Icon(Icons.language),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
