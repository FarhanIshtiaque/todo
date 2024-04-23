import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo/config/routes/app_pages.dart';
import 'package:todo/features/dashboard/screens/add_task.dart';
import 'package:todo/features/dashboard/screens/layout.dart';
import 'package:todo/features/dashboard/screens/task_details.dart';


abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.LAYOUT, page: () => const Layout()),
    GetPage(name: Routes.ADDTASK, page: ()=> const AddTask()),
    GetPage(name: Routes.TASKDETAILS, page: ()=> const TaskDetails())
  ];
}
