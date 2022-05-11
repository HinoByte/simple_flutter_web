import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/models/news.dart';
import 'package:magazin/widgets/main_frame.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController _newsController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newsController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _newsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 500),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Добро пожаловать,администратор'),
              Text('Это панель управления сайтом'),
              Text('Здесь можно размещать новости'),
              TextField(
                controller: _newsController,
                decoration: InputDecoration(
                    hintText: "Заголовок новости",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Описание новости",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Api().addNews(News(
                      name: _newsController.text,
                      discription: _descriptionController.text,
                      idUser: 1,
                      dataTime: DateTime.now().toIso8601String(),
                    ));
                  },
                  child: Text('Разместить новость'))
            ],
          ),
        ),
      ),
    );
  }
}
