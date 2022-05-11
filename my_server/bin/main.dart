import 'package:my_server/initDB/addTestToys.dart';
import 'package:my_server/initDB/createDB.dart';
import 'package:my_server/my_server.dart';

Future main() async {
  final app = Application<MyServerChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 9998;

  await app.start();

  final fileDB = File('/home/hino/toys.db');
// ignore: avoid_slow_async_io
  final exisFile = await fileDB.exists();
  if (!exisFile) {
    await CreateDB().initDB();
    print('Создана БД');
    AddTestToys().addTestInfo();
    print('Добавлены товары');
  }

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
