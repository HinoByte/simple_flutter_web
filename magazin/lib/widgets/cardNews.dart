import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magazin/models/news.dart';
import 'package:magazin/res/styles.dart';

class CardNews extends StatelessWidget {
  const CardNews({Key key, @required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                news.dataTime != null
                    ? DateFormat('yyyy-MM-dd – kk:mm')
                        .format(DateTime.parse(news.dataTime))
                        .toString()
                    : 'Время новости неизвестно',
                style: AppStyles.h20M.copyWith(fontSize: 20),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                news.name,
                style: AppStyles.h20M
                    .copyWith(fontSize: 25, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  news.discription,
                  style: AppStyles.h20M.copyWith(fontSize: 20),
                ),
              ),
            ],
          ),
        ));
  }
}
