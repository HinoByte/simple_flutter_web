import 'dart:async';

import 'package:my_server/database.dart';
import 'package:my_server/models/news.dart';
import 'package:my_server/models/toys.dart';
import 'package:my_server/models/users.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AddTestToys {
  Database _database;

  Future<Database> get database async =>
      _database != null ? _database : await initDB();

  Future<Database> initDB() async {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    final Database db =
        await databaseFactory.openDatabase('/home/hino/toys.db');
    return db;
  }

  final List<Toys> toys = [
    Toys(
      nameToy: 'Гитара',
      discription: 'Первая гитара. Ваш путь в мир музыки',
      image: 'product-300204-1.jpg',
      type: 'edu_toy',
      price: 6450,
    ),
    Toys(
      nameToy: 'Конструктор на магнитах',
      discription: 'Конструктор на магнитах. Развивает объемное мышление',
      image: '6000148668.jpg',
      type: 'edu_toy',
      price: 2250,
    ),
    Toys(
      nameToy: 'Конструктор',
      discription: 'Мой первый конструктор',
      image: '100024223629b0.jpg',
      type: 'edu_toy',
      price: 3200,
    ),
    Toys(
      nameToy: 'Игра ГО',
      discription: 'Древняя восточная игра го. Учимся побеждать',
      image: '9c64832bec52c5ccc4e6696e33c95399.jpg',
      type: 'logic_toy',
      price: 7000,
    ),
    Toys(
      nameToy: 'Шахматы',
      discription: 'Шахматы. Игра, завоевавшая миллионы поклонников',
      image: '6005684040.jpg',
      type: 'logic_toy',
      price: 3010,
    ),
    Toys(
      nameToy: 'Шашки',
      discription: 'Шашки. Для всех и каждого',
      image: 'igroved-draughts-02.jpg',
      type: 'logic_toy',
      price: 4999,
    ),
    Toys(
      nameToy: 'Счеты',
      discription: 'Разноцветные счеты. Учимся считать',
      image: '5d1ec97a8f56f8658eb8491f63b13602.jpg',
      type: 'school_toy',
      price: 610,
    ),
    Toys(
      nameToy: 'Счетные палочки',
      discription: 'Яркие счетные палочки. Скоро в школу',
      image: '3532cb57247af670e761b06fcef8a662.jpg',
      type: 'school_toy',
      price: 780,
    ),
    Toys(
      nameToy: 'Ручки',
      discription: 'Набор ручек. Выбор детей',
      image:
          'de9df3e6_2068_11e8_bbed_00e04ca2c22c_fea2b409_25e2_11e8_9bb9_00e04ca2c22c.jpeg',
      type: 'school_toy',
      price: 460,
    ),
    Toys(
      nameToy: 'Полярный мишка',
      discription: 'Пушистый мишка, за которым не надо ехать на Северный Полюс',
      image: '0.jpg',
      type: 'soft_toy',
      price: 940,
    ),
    Toys(
      nameToy: 'Единорог',
      discription: 'Брелок на сумку. Носи своего единорога с собой',
      image: '1.jpg',
      type: 'soft_toy',
      price: 400,
    ),
    Toys(
      nameToy: 'Лемур',
      discription: 'Лемур. Прямо с Мадагаскара',
      image: '2.jpg',
      type: 'soft_toy',
      price: 630,
    ),
    Toys(
      nameToy: 'Семья мишек',
      discription: 'Семья мишек. Лучший подарок',
      image: '3.jpg',
      type: 'soft_toy',
      price: 5600,
    ),
    Toys(
      nameToy: 'Мишка в свитере',
      discription: 'Мишка в свитере. Никогда не замерзнет',
      image: '5.jpg',
      type: 'soft_toy',
      price: 520,
    ),
    Toys(
      nameToy: 'Кот в стразах',
      discription: 'Кот в стразах. Не чеши его против шерсти',
      image: '6.jpg',
      type: 'soft_toy',
      price: 480,
    ),
    Toys(
      nameToy: 'Кенгуру',
      discription: 'Кенгуру из Австралии. В ассортименте',
      image: '7.jpg',
      type: 'soft_toy',
      price: 390,
    ),
    Toys(
      nameToy: 'Звездный кот',
      discription: 'Звездный кот, живет у звезд',
      image: '8.jpg',
      type: 'soft_toy',
      price: 999,
    ),
    Toys(
      nameToy: 'Ночной кот',
      discription: 'Ночной кот собирается на карнавал',
      image: '9.jpg',
      type: 'soft_toy',
      price: 999,
    ),
    Toys(
      nameToy: 'Лама',
      discription: 'Лама. Для самых мягких объятий',
      image: '10.jpg',
      type: 'soft_toy',
      price: 600,
    ),
    Toys(
      nameToy: 'Мишка с бантиком',
      discription: 'Мишка с бантиком. Всегда готов встречать гостей',
      image: '11.jpg',
      type: 'soft_toy',
      price: 520,
    ),
    Toys(
      nameToy: 'Яркий мяч',
      discription: 'Яркий мяч для ярких побед',
      image: '91f2a71c43cc06386505cb8f1b1f4805.jpg',
      type: 'sport_toy',
      price: 1300,
    ),
    Toys(
      nameToy: 'Футбольный мяч для профи',
      discription: 'Футбольный мяч. Победи всех',
      image: '1247785859_w640_h640_futbolnyj-myach-nike.jpg',
      type: 'sport_toy',
      price: 2700,
    ),
    Toys(
      nameToy: 'Баскетбольный мяч',
      discription: 'Баскетбольный мяч. Все выше и выше',
      image: 'basketball.jpg',
      type: 'sport_toy',
      price: 2800,
    ),
    Toys(
      nameToy: 'Футбольный мяч',
      discription: 'Футбольный мяч. Незаменимый спутник для дружной компании',
      image: 'football_PNG52759.png',
      type: 'sport_toy',
      price: 1700,
    ),
    Toys(
      nameToy: 'Воздушный змей',
      discription: 'Мой первый воздушный змей',
      image: '0.jpg',
      type: 'street_toy',
      price: 600,
    ),
    Toys(
      nameToy: 'Воздушный змей с хвостом',
      discription: 'Воздушный змей с хвостом. Не забудь похвастаться',
      image: '4cd01f5ecefdeed6f2d4d31d1d72e012.jpg',
      type: 'street_toy',
      price: 1600,
    ),
    Toys(
      nameToy: 'Воздушный змей для профи',
      discription: 'Воздушый змей для профи. Поднимаем планку',
      image: '137118.jpg',
      type: 'street_toy',
      price: 2600,
    ),
    Toys(
      nameToy: 'Мягкие кубики',
      discription: 'Мягкие кубики. Составь слово!',
      image: '549548656_w640_h640_bolshie-myagkie-kubiki.jpg',
      type: 'room_toy',
      price: 700,
    ),
    Toys(
      nameToy: 'Палатка',
      discription: 'Палатка. Лучшее место для игр',
      image: '6004238684.jpg',
      type: 'room_toy',
      price: 5000,
    ),
    Toys(
      nameToy: 'Твистер',
      discription: 'Твистер. Проверь свою стойкость',
      image: 'xjztun74xus.jpg',
      type: 'room_toy',
      price: 320,
    ),
  ];

  final List<Users> users = [
    Users(
      login: 'test',
      password: 'test',
    ),
    Users(
      login: 'admin',
      password: 'admin',
      isAdmin: 1,
    ),
  ];

  final List<News> news = [
    News(
      name: 'Ура! Мы открылись',
      discription: 'Всех покупателей поздравляем!',
    ),
    News(
      name: 'Поступление новых товаров',
      discription: 'В наличии новые игрушки и развивающие игры',
    )
  ];

  void addTestInfo() {
    toys.forEach(
      (toy) {
        DataBase().insertToy(toy);
      },
    );
    users.forEach(
      (user) {
        DataBase().insertUser(user);
      },
    );
    news.forEach(
      (news) {
        DataBase().insertNews(news);
      },
    );
  }
}
