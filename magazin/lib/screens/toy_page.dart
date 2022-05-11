import 'package:flutter/material.dart';
import 'package:magazin/models/toys.dart';
import 'package:magazin/widgets/main_frame.dart';

class ToyPage extends StatelessWidget {
  const ToyPage({Key key, @required this.toy}) : super(key: key);
  final Toys toy;

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              toy.nameToy,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Image(
              width: 350,
              height: 350,
              image: AssetImage('assets/${toy.type}/${toy.image}'),
            ),
            Text(toy.discription),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('В Каталог'),
                ),
                SizedBox(
                  width: 200,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Купить'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
