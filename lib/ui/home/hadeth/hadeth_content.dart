import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/hadeth/Hadeth.dart';
import 'package:islami/ui/home/hadeth/hadeth_carousel_view.dart';

class HadethContent extends StatefulWidget {
  HadethContent({super.key});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  final CarouselController controller = CarouselController(initialItem: 0);
  List<Hadeth> hadethList = [];
  @override
  Widget build(BuildContext context) {
    if (allHadeth.isEmpty) {
      loadHadeth();
    }
    return Container(
        child: allHadeth.isEmpty ? Center(child: CircularProgressIndicator()) :
        CarouselView.weighted(
          controller: controller,
          itemSnapping: true,
          flexWeights: const <int>[1, 8, 1],
          children: allHadeth.map((hadeth) {
            return HadethCarouselView(hadeth);
          }).toList(),)
    );
  }

  List<Hadeth> allHadeth = [];

  void loadHadeth() async {
    String fileContent = await rootBundle.loadString(
        "assets/files/ahadeth.txt");
    List<String> hadethContentList = fileContent.trim().split('#');
    for (int i = 0; i < hadethContentList.length; i++) {
      String singleHadethContent = hadethContentList[i].trim();
      int indexOfFrstLine = singleHadethContent.indexOf('\n');
      String title = singleHadethContent.substring(0, indexOfFrstLine);
      String content = singleHadethContent.substring(indexOfFrstLine + 1);

      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }
    setState(() {

    });
  }
}
