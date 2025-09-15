// class AppRoutesConstants{
//   static const String homeScreen = 'home';
// }
enum AppRoutes {
  HomeScreen('home'),
  ChapterDetails('chapter_details')
  // SuraDetails('sura_details'),
  ;

  final String route;

  const AppRoutes(this.route);
}
