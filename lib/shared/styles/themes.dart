import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: primaryClrDark,

  appBarTheme:  const AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryClrDark,
        statusBarIconBrightness:Brightness.light,
      ),
      backgroundColor: primaryClrDark,
      elevation: 0,
      iconTheme: IconThemeData(
          color: white,
      )
  ),



);



ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: white,

  appBarTheme:  const AppBarTheme(
      titleSpacing: 20,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness:Brightness.dark,
      ),
      backgroundColor: white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: black,
      )
  ),

) ;