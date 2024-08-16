
import 'package:flutter/cupertino.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';
import 'package:netflix_api/presentation/home/widgets/number_card.dart';
import 'package:netflix_api/presentation/widgets/main_title.dart';


class NumberTitleCard extends StatelessWidget {
final List movies;
  const NumberTitleCard({
    super.key,required this.movies
  });

 

  @override
  Widget build(BuildContext context) {
    var widgetsize=MediaQuery.of(context).size;
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               const MainTitle(title: "Top 10 Tv Shows In India Today"),
            kHeigth,
              LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            movies.length,
            (index) =>  NumberCard(index: index,url: imageBase+popular[index].imagePath,widgetsize: widgetsize,),
          ),
        ),
              ),
            ]);
  }
}


