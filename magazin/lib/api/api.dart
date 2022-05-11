import 'package:http/http.dart' as http;
import 'package:magazin/models/news.dart';
import 'dart:convert';

import 'package:magazin/models/toys.dart';
import 'package:magazin/models/users.dart';

class Api {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  void addToy(Toys toy) async {
    var url = Uri.http('localhost:9998', '/addToy');
    await http.post(
      url,
      body: jsonEncode(toy),
      headers: headers,
    );
  }

  void addNews(News news) async {
    var url = Uri.http('localhost:9998', '/addNews');
    await http.post(
      url,
      body: jsonEncode(news),
      headers: headers,
    );
  }

  Future<bool> registration(Users user) async {
    var url = Uri.http('localhost:9998', '/reg');
    final post = await http.post(
      url,
      body: jsonEncode(user),
      headers: headers,
    );
    return (post.statusCode == 200) ? true : false;
  }

  Future<List<Toys>> checkPassword() async {
    var url = Uri.http('localhost:9998', '/getAllToys');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Toys> toys =
          parsed.map<Toys>((json) => Toys.fromJson(json)).toList();
      return toys;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to Load');
    }
  }

  Future<List<Toys>> getAllToys() async {
    var url = Uri.http('localhost:9998', '/getAllToys');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<Toys> toys =
          parsed.map<Toys>((json) => Toys.fromJson(json)).toList();
      return toys;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to Load Toys');
    }
  }

  Future<List<News>> getAllNews() async {
    var url = Uri.http('localhost:9998', '/getAllNews');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      List<News> news =
          parsed.map<News>((json) => News.fromJson(json)).toList();
      return news;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to Load News');
    }
  }
}
