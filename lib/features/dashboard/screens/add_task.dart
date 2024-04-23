import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/constants/app_values.dart';
import 'package:todo/core/constants/text_styles.dart';
import 'package:todo/core/helper/validator.dart';
import 'package:todo/core/resource/widgets/primary_button.dart';
import 'package:todo/core/resource/widgets/primary_textfield.dart';
import 'package:todo/features/dashboard/controllers/task_controller.dart';

import '../../../core/helper/logger.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: AppTextStyle.body1Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
        child: Form(
          key: taskController.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              PrimaryTextField(
                hintText: 'Task Name',
                validator: (v) => Validator.validateName(v!),
                controller: taskController.nameController,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryTextField(
                hintText: 'Task Details',
                validator: (v) => Validator.validateDescription(v!),
                controller: taskController.descriptionController,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryTextField(
                controller: taskController.dateController,
                validator: (v) => Validator.validateDate(v!),
                hintText: 'Select Date',
                readOnly: true,
                onTap: () async {
                  taskController.dateController.clear();
                  var results = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(),
                    dialogSize: const Size(325, 400),
                    borderRadius: BorderRadius.circular(15),
                  );
                  logger.d(results);
                  if (results!.isNotEmpty) {
                    taskController.selectedDate(results[0].toString());
                    taskController.dateController.text =
                        DateFormat.yMMMMd().format(results[0]!).toString();
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              PrimaryButton(
                  onPressed: () {
                    final isValid = taskController.key.currentState!.validate();

                    if (isValid) {
                      logger.d(isValid);
                      taskController.addTask(
                          name: taskController.nameController.text.trim(),
                          description:
                              taskController.descriptionController.text.trim(),
                          dateTime: DateTime.parse(
                              taskController.selectedDate.value));
                    }
                    logger.d(taskController.taskList);
                  },
                  buttonNameWidget: const Text(
                    'Add',
                    style: AppTextStyle.button2,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
