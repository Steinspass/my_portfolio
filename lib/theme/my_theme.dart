import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myThemeWeb() {
  
  final ThemeData myTheme = 
  ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[900],
    primaryColor: Colors.yellowAccent[400],
    accentColor: Colors.grey[800],
    textTheme: GoogleFonts.josefinSansTextTheme(),
    // textTheme: GoogleFonts.latoTextTheme(
    //     TextTheme(
    //       headline6: TextStyle(
    //         fontSize: 28.0,
    //         fontStyle: FontStyle.italic,
    //         fontWeight: FontWeight.w300
    //       )
    //     )
    //   ),

    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      elevation: 15.0,
      color: Colors.transparent,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.yellowAccent[400],
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        )
      ),
    )

  );



  return myTheme;
}