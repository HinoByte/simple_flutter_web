import 'package:flutter/material.dart';
import 'package:magazin/widgets/appBarDesign.dart';
import 'package:magazin/widgets/bottomInfo.dart';

class MainFrame extends StatelessWidget {
  const MainFrame({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesign(),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: child,
          ),
          BottomCompanyInfo(),
        ],
      ),
    );
  }
}
