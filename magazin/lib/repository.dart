import 'package:magazin/models/news.dart';
import 'package:magazin/models/toys.dart';

class Repository {
  Repository._privateConstructor();
  List<Toys> listToys;
  List<News> listNews;

  static final Repository instance = Repository._privateConstructor();
}
