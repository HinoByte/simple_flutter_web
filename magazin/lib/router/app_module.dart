import 'package:flutter_modular/flutter_modular.dart';
import 'package:magazin/models/toys.dart';
import 'package:magazin/repository.dart';
import 'package:magazin/screens/admin_page.dart';
import 'package:magazin/screens/catalog_page.dart';
import 'package:magazin/screens/home_page.dart';
import 'package:magazin/screens/news_page.dart';
import 'package:magazin/screens/promotion_page.dart';
import 'package:magazin/screens/reg_page.dart';
import 'package:magazin/screens/company_page.dart';
import 'package:magazin/screens/toy_page.dart';

class AppModule extends Module {
  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/promotions',
        child: (_, __) => PromotionPage(), transition: TransitionType.fadeIn),
    ChildRoute('/catalog',
        child: (_, __) => CatalogPage(), transition: TransitionType.fadeIn),
    ChildRoute('/company',
        child: (_, __) => CompanyPage(), transition: TransitionType.fadeIn),
    ChildRoute('/admin',
        child: (_, __) => AdminPage(), transition: TransitionType.fadeIn),
    ChildRoute('/news',
        child: (_, __) => NewsPage(), transition: TransitionType.fadeIn),
    ChildRoute('/registration',
        child: (_, __) => RegistrationPage(),
        transition: TransitionType.fadeIn),
    ChildRoute('/toy/:id', child: (_, args) {
      print(Repository.instance.listToys.length);
      Toys toy = Repository.instance.listToys
          .singleWhere((e) => e.idToy == int.parse(args.params['id']));
      return ToyPage(
        toy: toy,
      );
    })
  ];
}
