import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(KMainImage),
            ),
          ),
        ),
      ],
    );
  }
}

