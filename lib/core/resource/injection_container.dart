import 'package:get_it/get_it.dart';
import 'package:todo/core/resource/local_storage/local_storage.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  LocalStorage localStorage = LocalStorage();
  localStorage.init();

  sl.registerLazySingleton(() => localStorage);
}