import 'package:my_server/database.dart';
import 'package:my_server/models/news.dart';
import 'package:my_server/models/toys.dart';
import 'package:my_server/models/users.dart';

import 'my_server.dart';

class MyServerChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/getAllToys").linkFunction((request) async {
      final List<Toys> toys = await DataBase().getAllToys();
      final List<Map<String, dynamic>> response =
          List.from(toys.map((toy) => toy.toJson()));
      return Response.ok(response)..contentType = ContentType.json;
    });

    router.route("/getAllNews").linkFunction((request) async {
      final List<News> news = await DataBase().getAllNews();
      final List<Map<String, dynamic>> response =
          List.from(news.map((news) => news.toJson()));
      return Response.ok(response)..contentType = ContentType.json;
    });

    router.route("/addToy").linkFunction((request) async {
      final body = await request.body.decode<Map<String, dynamic>>();
      final Toys toy = Toys.fromJson(body);
      DataBase().insertToy(toy);
      return Response.ok(200)..contentType = ContentType.json;
    });

    router.route("/addNews").linkFunction((request) async {
      final body = await request.body.decode<Map<String, dynamic>>();
      final News news = News.fromJson(body);
      DataBase().insertNews(news);
      return Response.ok(200)..contentType = ContentType.json;
    });

    router.route("/reg").linkFunction((request) async {
      final body = await request.body.decode<Map<String, dynamic>>();
      final Users user = Users.fromJson(body);
      DataBase().insertUser(user);
      return Response.ok(200)..contentType = ContentType.json;
    });

    return router;
  }
}
