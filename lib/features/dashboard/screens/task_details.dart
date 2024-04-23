import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_values.dart';
import 'package:todo/core/constants/text_styles.dart';
import 'package:todo/core/helper/logger.dart';
import 'package:todo/core/helper/validator.dart';
import 'package:todo/core/resource/widgets/primary_button.dart';
import 'package:todo/core/resource/widgets/primary_textfield.dart';
import 'package:todo/features/dashboard/controllers/task_controller.dart';
import 'package:todo/features/dashboard/data/task_model.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({super.key});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}




class _TaskDetailsState extends State<TaskDetails> {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
   DateTime? dateTime ;
  late final String id;
  late final bool status;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Task task = Get.arguments;
    nameController.text = task.name;
    descriptionController.text = task.description;
    dateController.text = DateFormat.yMMMMd().format(task.date).toString();
    id = task.id;
    status = task.status;
    dateTime = task.date;



  }

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Details',
          style: AppTextStyle.body1Bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding),
        child:  Form(
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
                controller: nameController,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryTextField(
                hintText: 'Task Details',
                validator: (v) => Validator.validateDescription(v!),
                controller: descriptionController,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryTextField(
                controller: dateController,
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
                   dateTime = results[0]!;
                   dateController.text =
                        DateFormat.yMMMMd().format(results[0]!).toString();
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Flexible(
                    child: PrimaryButton(
                      color: AppColors.error500,
                        onPressed: () {
                          taskController.taskList.removeAt(taskController.selectedTaskIndex.value);
                          Get.back();
                          Get.snackbar('Success', 'Task deleted');
                        },
                        buttonNameWidget: const Text(
                          'Delete',
                          style: AppTextStyle.button2,
                        )),
                  ),
                  const SizedBox(width: 16,),
                  Flexible(
                    child: PrimaryButton(
                        onPressed: () {
                          final isValid = taskController.key.currentState!.validate();

                          if (isValid) {
                       taskController.taskList[taskController.selectedTaskIndex.value]= Task(id: id,
                           name: nameController.text,
                           description: descriptionController.text,
                           status: status,
                           date: dateTime!);

                       Get.back();
                       Get.snackbar('Success', 'Task updated');
                          }
                        },
                        buttonNameWidget: const Text(
                          'Update',
                          style: AppTextStyle.button2,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
