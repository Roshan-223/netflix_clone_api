
import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_api/presentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    super.key, required this.image, required this.moviename, required this.desc,
  });
 final String image;
  final String moviename;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeigth,
        Text(
          moviename,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeigth,
         Text(
        desc,
           style: const TextStyle(color: kGreyColor),
        ),
        kHeigth50,
         VideoWidget(image: image,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              icon: Icons.share_outlined,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
              kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "play",
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
          ],
        ),
      ],
    );
  }
}
