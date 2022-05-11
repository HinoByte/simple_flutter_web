import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/models/news.dart';
import 'package:magazin/widgets/cardNews.dart';
import 'package:magazin/widgets/main_frame.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<News>> news;

  @override
  void initState() {
    super.initState();
    news = Api().getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 550,
                  child: FutureBuilder<List<News>>(
                    future: news,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<News> data = snapshot.data;
                        data = data.reversed.toList();
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 550,
                            mainAxisExtent: 500,
                            childAspectRatio: 1,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return CardNews(
                              news: data[index],
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error");
                      }
                      return Text("Loading...");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
