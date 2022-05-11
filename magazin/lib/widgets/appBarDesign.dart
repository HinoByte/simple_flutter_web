import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magazin/res/styles.dart';

class AppBarDesign extends StatelessWidget with PreferredSizeWidget {
  const AppBarDesign({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.brown,
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    height: 25,
                    width: 250,
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/background/zaigraikin.png')),
                BottomTop(
                  text: 'О нас',
                  route: '/company',
                  style: AppStyles.h20L,
                ),
                SelectableText(
                  'Как купить',
                  style: AppStyles.h20L,
                ),
                SelectableText(
                  'Контакты',
                  style: AppStyles.h20L,
                ),
                InkWell(
                  onTap: () {
                    Modular.to.navigate('/registration');
                  },
                  child: Text(
                    'Зарегистрироваться',
                    style: AppStyles.h20L,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomTop(
                  text: 'Главная',
                  route: '/',
                  style: AppStyles.h20M,
                ),
                BottomTop(
                  text: 'Каталог',
                  route: '/catalog',
                  style: AppStyles.h20M,
                ),
                BottomTop(
                  text: 'Новости',
                  route: '/news',
                  style: AppStyles.h20M,
                ),
                BottomTop(
                  text: 'Акции',
                  route: '/promotions',
                  style: AppStyles.h20M,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class BottomTop extends StatelessWidget {
  const BottomTop({
    Key key,
    @required this.text,
    @required this.route,
    @required this.style,
  }) : super(key: key);

  final text;
  final route;
  final style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.navigate(route);
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
