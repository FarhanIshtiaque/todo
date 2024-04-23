import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/helper/logger.dart';
import 'package:todo/core/resource/local_storage/local_storage.dart';
import 'package:todo/features/dashboard/data/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskController extends GetxController {
  final  localStorage = LocalStorage();

  var taskList = <Task>[].obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  var selectedDate = ''.obs;
  var selectedTaskIndex = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllTasks();

  }


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
    var uuid = const Uuid().v1();
    Task data = Task(
        id: uuid,
        status: false,
        name: name,
        description: description,
        date: dateTime);
    taskList.add(data);
    localStorage.insertTask(data);

    Get.back();
    Get.snackbar('Success', "Your task added successfully");
  }

  void fetchAllTasks() async{
    final allTask = await localStorage.getTasks();
    taskList.assignAll(allTask);
    logger.d(taskList);
  }

}
