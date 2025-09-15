import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xffE2BE7F);
  static const Color blackColor = Color(0xff202020);
  static const Color grayColor = Color(0xff707070);
  static const Color whiteColor = Color(0xffffffff);
  static const Color offWhiteColor = Color(0xffFFF5E3);
  static const Color brownColor = Color(0xff946107);
}

class AppImages {
  // static const String ic_time = 'assets/images/ic_time.png';
  static const String ic_time = 'assets/images/ic_time.svg';
  static const String ic_sebha = 'assets/images/ic_sebha.svg';
  static const String ic_radio = 'assets/images/ic_radio.svg';
  static const String ic_quran = 'assets/images/ic_quran.svg';
  static const String ic_hadeth = 'assets/images/ic_hadeth.svg';
  static const String ic_chapter = 'assets/images/ic_chapter.svg';
  static const String background = 'assets/images/Background.jpg';
  static const String chapterDetailsBackground =
      'assets/images/chapter_details_background.png';
  static const String logo = 'assets/images/Logo.png';
}

class AppThemes {
  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      // backgroundColor: Colors.transparent,
      // surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    colorScheme: ColorScheme.dark(primary: AppColors.primaryColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 36),
      unselectedItemColor: Colors.black,
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 24),
      showUnselectedLabels: true,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
