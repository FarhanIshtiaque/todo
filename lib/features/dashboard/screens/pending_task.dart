import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/config/routes/app_pages.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_values.dart';
import 'package:todo/core/constants/text_styles.dart';
import 'package:todo/features/dashboard/controllers/task_controller.dart';
import 'package:todo/features/dashboard/data/task_model.dart';
import 'package:todo/features/dashboard/screens/widgets/task_card.dart';

class PendingTask extends StatelessWidget {
  const PendingTask({super.key});

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
                () => AnimationLimiter(
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Task task = taskController.pendingTasks[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: TaskCard(
                                isChecked: task.status,
                                name: task.name,
                                date: task.date,
                                onTap: () {
                                  Get.toNamed(Routes.TASKDETAILS,
                                      arguments:
                                          taskController.pendingTasks[index]);
                                  taskController.selectedTaskIndex(index);
                                },
                                onChanged: (bool? value) {
                                  task.toggleStatus();
                                  taskController.updateTask(task);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: taskController.pendingTasks.length),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

