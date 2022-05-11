import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/repository.dart';
import 'package:magazin/router/app_module.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  Repository.instance.listToys = await Api().getAllToys();
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      title: 'Flutter Demo',
    ).modular();
  }
}
