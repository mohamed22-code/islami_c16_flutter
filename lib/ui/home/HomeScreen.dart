import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/ui/common/app_screen_rapper.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/player/player_content.dart';
import 'package:islami/ui/home/quran/quran_content.dart';
import 'package:islami/ui/home/radio/radio_content.dart';
import 'package:islami/ui/home/sebha/sebha_content.dart';

import 'hadeth/hadeth_content.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScreenWrapper(
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: Column(
            children: [
              if(selectedTabIndex != 2)
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    AppImages.logo,
                    fit: BoxFit.fitHeight,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 1,
                  ),
                ),

              Expanded(
                flex: selectedTabIndex == 2 ? 2 : 9,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  child: tabs[selectedTabIndex],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedTabIndex,
            onTap: (index) {
              setState(() {
                selectedTabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: SvgPicture.asset(
                    AppImages.ic_quran, width: 24, height: 24),
                label: 'quran',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: SvgPicture.asset(
                  AppImages.ic_hadeth,
                  width: 24,
                  height: 24,
                ),
                label: 'hadeth',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: SvgPicture.asset(
                    AppImages.ic_sebha, width: 24, height: 24),
                label: 'sebha',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: SvgPicture.asset(
                    AppImages.ic_radio, width: 24, height: 24),
                label: 'radio',
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.primaryColor,
                icon: SvgPicture.asset(
                    AppImages.ic_time, width: 24, height: 24),
                label: 'player',
              ),
            ],
          ),
        ),
      ),
    );
  }

  var tabs = [
    QuranContent(),
    HadethContent(),
    SebhaContent(),
    RadioContent(),
    PlayerContent(),
  ];
}
