import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:magazin/models/toys.dart';

class CardToys extends StatelessWidget {
  const CardToys({
    Key key,
    @required this.toy,
  }) : super(key: key);
  final Toys toy;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(
            toy.nameToy,
            style: TextStyle(fontSize: 15),
          ),
          Column(
            children: [
              Image(
                width: 250,
                height: 150,
                image: AssetImage('assets/${toy.type}/${toy.image}'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Modular.to.navigate('toy/${toy.idToy}');
                    },
                    child: Text(
                      'подробнее',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SelectableText(
                    '${toy.price} рублей',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
