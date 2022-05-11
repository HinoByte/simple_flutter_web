import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/models/toys.dart';
import 'package:magazin/repository.dart';
import 'package:magazin/widgets/cardToys.dart';
import 'package:magazin/widgets/main_frame.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Future<List<Toys>> toys;
  //Repository three = Repository.instance;

  @override
  void initState() {
    super.initState();
    toys = Api().getAllToys();
  }

  @override
  Widget build(BuildContext context) {
    //int count = widget.toys.length;
    return MainFrame(
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FutureBuilder<List<Toys>>(
                future: toys,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Repository.instance.listToys = snapshot.data;
                    return GridView.builder(
                      addSemanticIndexes: true,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        mainAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return CardToys(
                          toy: snapshot.data[index],
                          // nameToy: snapshot.data[index].nameToy,
                          // image:
                          //     'assets/${snapshot.data[index].type}/${snapshot.data[index].image}',
                          // price: snapshot.data[index].price,
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
      ),
    );
  }
}
