import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? photo;
  pickImageFromCamera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

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
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Padding(
                        padding: EdgeInsets.all(18.0.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomButton(
                              title: 'Camera'.tr(),
                              ontap: () {
                                pickImageFromCamera();
                                Navigator.pop(context);
                              },
                            ),
                            20.verticalSpace,
                            CustomButton(
                              title: 'Gallary'.tr(),
                              ontap: () {
                                pickImageFromGallery();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Color(0xffe8ecf5),
                    backgroundImage: photo != null
                        ? Image.file(File(photo?.path ?? "")).image
                        : null,
                    child: photo == null
                        ? Icon(Icons.person, color: Colors.blue, size: 32)
                        : null,
                  ),
                ),
              ),
              15.verticalSpace,
              Center(
                child: Text(
                  LocaleKeys.create_profile.tr(),
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
                  LocaleKeys.add_name_picture.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff858891),
                  ),
                ),
              ),
              15.verticalSpace,
              Text(
                LocaleKeys.full_name.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1b1b21),
                ),
              ),
              5.verticalSpace,
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: LocaleKeys.name_hint.tr(),
                ),
              ),
              20.verticalSpace,
              Center(
                child: CustomButton(
                  title: LocaleKeys.continueButton.tr(),
                  ontap: () {},
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
