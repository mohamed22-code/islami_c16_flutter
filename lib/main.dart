import 'package:flutter/material.dart';
import 'package:islami/ui/chapter_details/chapterDetails.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/introduction/intro_screen.dart';
import 'package:islami/ui/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.IntroScreen.route,
      routes: {
        AppRoutes.IntroScreen.route: (context) => IntroScreen(),
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
      },
    );
  }
}
