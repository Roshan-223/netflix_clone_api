import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';
import 'package:netflix_api/presentation/widgets/main_card.dart';
import 'package:netflix_api/presentation/widgets/main_title.dart';

  
class MainTitleCard extends StatelessWidget {


  const MainTitleCard({
    super.key, required this.title, required this.widgetsize, required this.movies
  });
final String title;
final Size widgetsize;
final List movies;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           MainTitle(title: title),
        kHeigth,
          LimitedBox(
    maxHeight: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        movies.length,
        (index) =>  MainCard2(image:imageBase+ movies[index].imagePath,),
      ),
    ),
          ),
        ]);
  }
}

