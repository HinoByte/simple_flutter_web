import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const h6 = TextStyle(
    fontSize: 12,
    height: 20 / 12,
    letterSpacing: -0.24,
    fontWeight: FontWeight.w300,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
  );
  static var h20L =
      GoogleFonts.lobster(fontSize: 20.0, color: Colors.blue[100]);
  static var h20M =
      GoogleFonts.merriweather(fontSize: 20.0, fontWeight: FontWeight.w200);
}
