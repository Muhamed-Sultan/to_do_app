import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel? taskModel;
  const TaskItem({super.key, this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(17.0.r),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: Color(taskModel!.color).withValues(alpha: .9),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            20.horizontalSpace,
            Expanded(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel?.title ?? "",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    taskModel?.description ?? "",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(taskModel!.color).withValues(alpha: .4),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          taskModel?.status ?? "",
                          style: TextStyle(
                            color: Color(taskModel!.color),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
