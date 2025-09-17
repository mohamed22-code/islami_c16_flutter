import 'package:flutter/material.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = 'intro';

  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  bool onFirstPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onFirstPage = (index == 0);
                onLastPage = (index == 4);
              });
            },
            children: [
              Container(child: Image.asset(AppImages.introPage1)),
              Container(child: Image.asset(AppImages.introPage2)),
              Container(child: Image.asset(AppImages.introPage3)),
              Container(child: Image.asset(AppImages.introPage4)),
              Container(child: Image.asset(AppImages.introPage5)),
            ],
          ),
          Container(
            alignment: Alignment(0, 1),
            child: Row(
              children: [
                onFirstPage
                    ? Text('')
                    : TextButton(
                        onPressed: () {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text('Back'),
                      ),
                Spacer(),
                SmoothPageIndicator(controller: _controller, count: 5),
                Spacer(),
                onLastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                        child: Text('Finish'),
                      )
                    : TextButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('Next'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
