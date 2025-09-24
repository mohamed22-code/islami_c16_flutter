import 'package:flutter/material.dart';
import 'package:islami/ui/chapter_details/chapterDetails.dart';
import 'package:islami/ui/common/most_recent_shared_prefences.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/introduction/intro_screen.dart';
import 'package:islami/ui/providers/most_recent_provider.dart';
import 'package:islami/ui/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences
      .init(); // wait until shared prefences being initialized
  runApp(
      ChangeNotifierProvider(
          create: (context) => MostRecentProvider(),
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
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
