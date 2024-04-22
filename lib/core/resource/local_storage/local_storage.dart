import 'package:sqflite/sqflite.dart';
import 'package:todo/core/helper/logger.dart';
import 'package:todo/features/task/data/task_model.dart';


class LocalStorage{

  String tableName = "cart";

  Database? database;

  Future<void> init() async{

    String databasePath = await getDatabasesPath();

    await openDatabase(
        "$databasePath/task_db",
        version: 1,
        onCreate: (db,version) async{
          String sqlQuery = "CREATE TABLE $tableName (id INTEGER PRIMARY KEY, name TEXT, price INTEGER, image_url TEXT, count INTEGER)";
          await db.execute(sqlQuery);
          database = db;
        },
        onOpen: (db){
          database = db;
        },

        onUpgrade: (db,oldVersion,newVersion){
          database = db;
        }
    );

  }

  Future<bool> addCart(Task task) async{
    int? isInserted =  await database?.insert(tableName, task.toJson());
    logger.d(isInserted);
    if (isInserted != null) {
      // Insertion was successful, and isInserted contains the ID of the inserted row
      return true;
    } else {
      // Insertion failed
      return false;
    }
  }

  Future<List<Task>> fetchAllCarts() async {
    List<Map<String, Object?>>? mapList = await database?.query(tableName);
    List<Task> taskList = [];

    if (mapList != null) {
      for (Map<String, Object?> item in mapList) {
        taskList.add(Task.fromJson(item));
      }
    } else {

      // Handle the case where mapList is null
      // For example, you could log an error message or throw an exception
    //  print('Error: mapList is null');
      return taskList;
       throw Exception('mapList is null'); // Uncomment this line to throw an exception
    }

    return taskList;
  }




  Future<void> delete(int id) async {
    await database?.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(Task task) async {
    await database?.update(tableName, task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }


}