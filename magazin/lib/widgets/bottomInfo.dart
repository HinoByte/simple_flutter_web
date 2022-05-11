import 'package:flutter/material.dart';

class BottomCompanyInfo extends StatelessWidget {
  const BottomCompanyInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      height: 25,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectableText(
              '© ООО "Заиграйкин", 2021',
            ),
            SelectableText('Телефон компании 8 - 499 - 000 - 00 - 00')
          ],
        ),
      ),
    );
  }
}
