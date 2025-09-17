import 'package:flutter/material.dart';
import 'package:islami/ui/home/HomeScreen.dart';
import 'package:islami/ui/introduction/intro_page1.dart';
import 'package:islami/ui/introduction/intro_page2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page3.dart';
import 'intro_page4.dart';
import 'intro_page5.dart';

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
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
              IntroPage5(),
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
