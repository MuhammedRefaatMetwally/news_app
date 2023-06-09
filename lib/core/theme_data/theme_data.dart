
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme{
  ThemeData getTheme(bool? isDark){
    if(isDark==true){
      return ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme:  TextTheme(
          bodyLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold,color: Colors.white),
          bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          bodySmall: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        appBarTheme:const AppBarTheme(
          elevation: 0,
          color: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      );
    }else{
      return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme:  TextTheme(
          bodyLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          bodySmall: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent),
        ),
        appBarTheme:const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      );
    }
  }
}