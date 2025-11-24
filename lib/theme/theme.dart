import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lighttheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    surfaceTintColor: Color(0xffeff3f6),
    backgroundColor: Color(0xffeff3f6),
  ),
  scaffoldBackgroundColor: const Color(0xffeff3f6),
  primaryColor: Colors.amberAccent[400],
  fontFamily: GoogleFonts.lato().fontFamily,
);

final ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.deepPurpleAccent,
  fontFamily: GoogleFonts.lato().fontFamily,
);
