import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';

class MainCard2 extends StatelessWidget {
   MainCard2({super.key,required this.image});
  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
    decoration:     BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
    );
  }
}