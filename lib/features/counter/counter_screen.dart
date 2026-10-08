import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/features/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30.w,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      icon: Icon(Icons.add),
                      iconSize: 40.r,
                    ),
                    Text(
                      context.read<CounterCubit>().counter.toString(),
                      style: TextStyle(fontSize: 40.sp),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      icon: Icon(Icons.remove),
                      iconSize: 40.r,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
