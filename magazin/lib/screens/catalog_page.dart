import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/models/toys.dart';
import 'package:magazin/widgets/cardToys.dart';
import 'package:magazin/widgets/main_frame.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  Future<List<Toys>> toys;
  TypeToys typeToys;

  @override
  void initState() {
    super.initState();
    toys = Api().getAllToys();
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildSeach(TypeToys.soft_toy, 'Мягкие игрушки'),
                          _buildSeach(TypeToys.edu_toy, 'Развивающие игрушки'),
                          _buildSeach(TypeToys.logic_toy, 'Логические игры'),
                          _buildSeach(TypeToys.school_toy, 'Всё для школы'),
                          _buildSeach(TypeToys.sport_toy, 'Спортивные товары'),
                          _buildSeach(
                              TypeToys.street_toy, 'Всё для игры на улице'),
                          _buildSeach(TypeToys.room_toy, 'Всё для дома'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<List<Toys>>(
                          future: toys,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Toys> data = snapshot.data;
                              switch (typeToys) {
                                case TypeToys.edu_toy:
                                  data = _seachToys(data, 'edu_toy');
                                  break;
                                case TypeToys.logic_toy:
                                  data = _seachToys(data, 'logic_toy');
                                  break;
                                case TypeToys.room_toy:
                                  data = _seachToys(data, 'room_toy');
                                  break;
                                case TypeToys.school_toy:
                                  data = _seachToys(data, 'school_toy');
                                  break;
                                case TypeToys.soft_toy:
                                  data = _seachToys(data, 'soft_toy');
                                  break;
                                case TypeToys.sport_toy:
                                  data = _seachToys(data, 'sport_toy');
                                  break;
                                case TypeToys.street_toy:
                                  data = _seachToys(data, 'street_toy');
                                  break;
                              }
                              return GridView.builder(
                                addSemanticIndexes: true,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  mainAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                ),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return CardToys(
                                    toy: data[index],
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("Error");
                            }
                            return Text("Loading...");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _seachToys(List<Toys> data, String type) =>
      data.where((e) => e.type == type).toList();

  Widget _buildSeach(TypeToys typetoys, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          typeToys = typetoys;
        });
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

enum TypeToys {
  edu_toy,
  logic_toy,
  room_toy,
  school_toy,
  soft_toy,
  sport_toy,
  street_toy,
}
