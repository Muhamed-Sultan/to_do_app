import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/utils/app_constant.dart';
import 'package:to_do_app/features/Tasks/task_screen.dart';
import 'package:to_do_app/features/home/widgets/app_bar.dart';
import 'package:to_do_app/features/home/widgets/task_item.dart';
import 'package:to_do_app/gen/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = Hive.box<TaskModel>(
      AppConstant.tasksBox,
    ).values.toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TaskScreen()),
          );
          setState(() {});
        },
        label: Row(children: [Icon(Icons.add), Text(LocaleKeys.add_task.tr())]),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: [
              HomeAppBar(),
              20.verticalSpace,
             tasks.isNotEmpty? Expanded(
                child: ListView.separated(
                  itemBuilder: ((context, index) =>
                      TaskItem(taskModel: tasks[index])),
                  separatorBuilder: (context, index) => 10.verticalSpace,
                  itemCount: tasks.length,
                ),
              ):Lottie.asset('assets/animation/box.json'),
            ],
          ),
        ),
      ),
    );
  }
}
