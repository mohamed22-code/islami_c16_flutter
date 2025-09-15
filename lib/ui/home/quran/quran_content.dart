import 'package:flutter/material.dart';
import 'package:islami/ui/chapter.dart';
import 'package:islami/ui/home/quran/chapter_row.dart';

class QuranContent extends StatelessWidget {
  QuranContent({super.key});

  final List<Chapter> chapters = Chapter.getQuranChapter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: chapters[index]);
            },
            itemCount: 114,
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.white,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
              );
            },
          ),
        ),
      ],
    );
  }
}
