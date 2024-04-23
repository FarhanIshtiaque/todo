import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/config/routes/app_pages.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_values.dart';
import 'package:todo/core/constants/text_styles.dart';
import 'package:todo/features/dashboard/controllers/task_controller.dart';

class PendingTask extends StatelessWidget {
  PendingTask({super.key});

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pending Task',
                style: AppTextStyle.body1Bold,
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        isChecked: isChecked,
                        name: taskController.taskList[index].name,
                        date: taskController.taskList[index].date,
                        onTap: (){
                          Get.toNamed(Routes.TASKDETAILS,
                            arguments: taskController.taskList[index]
                          );
                          taskController.selectedTaskIndex(index);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: taskController.taskList.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.isChecked,
    required this.name,
    required this.date, this.onTap,
  });

  final bool isChecked;
  final String name;
  final DateTime date;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.body2Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    DateFormat.yMMMMd().format(date).toString(),
                    style:
                        AppTextStyle.caption2.copyWith(color: AppColors.natural4),
                  )
                ],
              ),
              Checkbox(
                side: const BorderSide(color: AppColors.natural5, width: 2),
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  // setState(() {
                  //   isChecked = value!;
                  // });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.white;
}
