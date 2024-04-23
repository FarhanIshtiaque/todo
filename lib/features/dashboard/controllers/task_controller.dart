import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        date: dateTime,
    );
    taskList.add(data);
    localStorage.insertTask(data);

    Get.back();
    Get.snackbar('Success', "Your task added successfully");
  }

  void fetchAllTasks() async{
    final allTask = await localStorage.getTasks();
    taskList.assignAll(allTask);

  }


  void updateTask (Task task){
    int index = taskList.indexWhere((element) => element.id == task.id);
    if (index != -1) {
      taskList[index] = task;
    }
   localStorage.updateTask(task);
    Get.back();
    Get.snackbar('Success', 'Task updated');

  }

  void deleteTask(String id){
    localStorage.deleteTask(taskList[selectedTaskIndex.value].id);
    taskList.removeWhere((task) => task.id == id);

    Get.back();
    Get.snackbar('Success', 'Task deleted');
  }

  // Computed property to get only tasks with status false
  List<Task> get pendingTasks {
    return taskList.where((task) => !task.status).toList();
  }
  List<Task> get doneTasks {
    return taskList.where((task) => task.status).toList();
  }

}
