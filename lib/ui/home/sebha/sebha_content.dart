import 'package:flutter/material.dart';
import 'package:islami/ui/design.dart';

class SebhaContent extends StatefulWidget {
  const SebhaContent({super.key});

  @override
  State<SebhaContent> createState() => _SebhaContentState();
}

class _SebhaContentState extends State<SebhaContent> {
  int count = 0;
  String currentText = 'سبحان الله';
  double rotateSebha = 0;

  void onSebhaTap() {
    setState(() {
      count++;
      rotateSebha += 0.05;
      if (count >= 33 && count < 66) {
        currentText = 'الحمد لله';
      } else if (count >= 66 && count < 99) {
        currentText = "الله اكبر";
      } else if (count >= 99) {
        count = 0;
        currentText = "سبحان الله";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(AppImages.sebhaBackground, width: double.infinity,
          fit: BoxFit.cover,),
        Image.asset(
          AppImages.logo,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.6,
        ),
        Positioned(
          top: 150,
          child: Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                fontSize: 36
            ),),
        ),
        Positioned(
          bottom: 50,
          child: GestureDetector(
              onTap: onSebhaTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    turns: rotateSebha,
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                        AppImages.sebha,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.9),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 60,),
                      Text(currentText, style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge,),
                      SizedBox(height: 20,),
                      Text('$count', style: Theme
                          .of(context)
                          .textTheme
                          .displayLarge,)
                    ],
                  )
                ],
              )),)
      ],
    );
  }
}
