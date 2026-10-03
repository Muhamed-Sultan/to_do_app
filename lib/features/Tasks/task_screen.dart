import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_feild.dart';
import 'package:to_do_app/features/Tasks/widgets/status_drop_down.dart';
import 'package:to_do_app/features/home/home_screen.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Color> taskColor = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.black,
    Colors.cyan,
    Colors.yellow,
    Colors.red,
    Colors.teal,
    Colors.grey,
  ];

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var statusController = TextEditingController();
  int? selectedIndexColor;

  void saveTask(TaskModel task) {
    Hive.box<TaskModel>(AppConstant.tasksBox)
        .add(task)
        .then((v) {
          Navigator.pop(context);
        })
        .catchError((e) {
          print(e.toString());
        });
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add Tasks'),
        centerTitle: true,
        actions: [
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
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFeild(
                nameController: titleController,
                hintText: LocaleKeys.task.tr(),
              ),
              20.verticalSpace,
              CustomTextFeild(
                nameController: descriptionController,
                hintText: LocaleKeys.task_description.tr(),
                maxlines: 5,
              ),
              20.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomTextFeild(
                      nameController: dateController,
                      hintText: LocaleKeys.date.tr(),
                      onTap: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2028),
                        ).then((value) {
                          dateController.text = DateFormat.yMMMMd().format(
                            value ?? DateTime.now(),
                          );
                        });
                      },
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: CustomTextFeild(
                      nameController: timeController,
                      hintText: LocaleKeys.time.tr(),
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          timeController.text = value?.format(context) ?? "";
                        });
                      },
                    ),
                  ),
                ],
              ),
              15.verticalSpace,
              StatusDropDown(
                onChanged: (value) {
                  statusController.text = value ?? "";
                  print("Test state : ${statusController.text}");
                },
              ),
              15.verticalSpace,
              Text(
                LocaleKeys.choose_your_task_color.tr(),
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              10.verticalSpace,
              SizedBox(
                height: 50.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndexColor = index;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: taskColor[index],
                      radius: 25.r,
                      child: index == selectedIndexColor
                          ? Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  ),
                  separatorBuilder: (context, index) => 10.horizontalSpace,
                  itemCount: taskColor.length,
                ),
              ),
              25.verticalSpace,
              CustomButton(
                title: LocaleKeys.add_task.tr(),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                  saveTask(
                    TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: dateController.text,
                      time: timeController.text,
                      status: statusController.text,
                      color: taskColor[selectedIndexColor ?? 0].toARGB32(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
