import 'package:flutter/material.dart';
import 'package:islami/ui/chapter_details/chapterDetails.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.HomeScreen.route,
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
        // AppRoutes.SuraDetails.route: (context) => SuraDetails(),
      },
    );
  }
}
