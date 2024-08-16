import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/presentation/widgets/main_card.dart';
class NumberCard extends StatelessWidget {
   const NumberCard({super.key, required this.index, required this.widgetsize, required this.url,});
 final int index;
 final Size widgetsize;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
              height: 200,
            ),
           MainCard2(image: url)
          ],
        ),
         Positioned(
          left: 16,
          bottom: -38,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: kWhiteColor,
            child: Text(
              '${index+1}',
              style:  const TextStyle(
                fontSize: 140,
                color: kBlackColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.black
                ),
            
                ),
          ),
              ),
      ],
    );
  }
}