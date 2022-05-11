import 'package:flutter/material.dart';
import 'package:magazin/widgets/main_frame.dart';

class PromotionPage extends StatefulWidget {
  PromotionPage({Key key}) : super(key: key);

  @override
  _PromotionPageState createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Column(
        children: [
          Text('promotions'),
        ],
      ),
    );
  }
}
