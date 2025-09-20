import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/ui/chapter.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/quran/chapter_row.dart';

class QuranContent extends StatefulWidget {

  QuranContent({super.key});

  @override
  State<QuranContent> createState() => _QuranContentState();
}

class _QuranContentState extends State<QuranContent> {
  List<Chapter> filterdChapter = [];
  final List<Chapter> chapters = Chapter.chapters;

  _QuranContentState() {
    filterdChapter = chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            filterChapters(text.toLowerCase());
          },
          decoration: InputDecoration(
              hintText: 'Search for chapter',
              prefix: ImageIcon(Svg(AppImages.ic_quran),
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme
                      .of(context)
                      .primaryColor,
                      width: 1)
              )
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: filterdChapter[index]);
            },
            itemCount: filterdChapter.length,
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

  void filterChapters(String text) {
    List<Chapter> filterList = [];
    for (int i = 0; i < chapters.length; i++) {
      if (chapters[i].englishName.toLowerCase().contains(text) ||
          chapters[i].arabicName.contains(text)) {
        filterList.add(chapters[i]);
      }
    }
    setState(() {
      filterdChapter = filterList;
    });
  }
}
