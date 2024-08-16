import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_api/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key, required this.image, required this.title, required this.desc, required this.releaseDate,
  });
 final String image;
  final String title;
  final String desc;
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

 DateTime parsedDate = DateTime.parse(releaseDate);
     String month = DateFormat('MMM').format(parsedDate); // Extract month
    String day = DateFormat('d').format(parsedDate);
    return Row(
      children: [
         SizedBox(
          width: 50,
          height: 450,
          child: Column(
            children: [
               Text(
                month,
                style: const TextStyle(fontSize: 20, color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: image,),
              kHeigth,
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                  
                      style: const TextStyle(
                          letterSpacing: -1,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications_none,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        title: "info",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth
                    ],
                  ),
                ],
                             ),
              kHeigth,
              const Text("Coming on Friday"),
              kHeigth,
               Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              kHeigth,
               Expanded(
                 child: Text(
                 desc,
                  style: const TextStyle(color: kGreyColor),
                               ),
               ),
            ],
          ),
        ),
      ],
    );
  }
}
