import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/features/dashboard/data/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskController extends GetxController {

  var taskList = <Task>[].obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  var selectedDate = ''.obs;
  var selectedTaskIndex = 0.obs;

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    dateController.dispose();
  }


  void addTask(
      {required String name,
      required String description,
      required DateTime dateTime}) {
    var uuid = Uuid().v1();
    taskList.add(Task(
        id: uuid,
        status: false,
        name: name,
        description: description,
        date: dateTime));
    Get.back();
    Get.snackbar('Success', "Your task added successfully");
  }

}
