import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/application/controller/controller_movie.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/7sqFEDDmK1hG5m92upolcfQxy7R.jpg";

class SearchIdle extends StatefulWidget {
  const SearchIdle({super.key});

  @override
  State<SearchIdle> createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
  List idealposters = [];
  Future idealmovies() async {
    idealposters = await MovieServices.getNowpopular();
    setState(() {});
  }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idealmovies();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches',),
        kHeigth,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) =>  TopSearchItemTile(image: imageBase + idealposters[index].imagePath,title: idealposters[index].title,),
            separatorBuilder: (context, index) => kHeigth20,
            itemCount: idealposters.length,
          ),
        ),
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
        kwidth,
         Expanded(
            child: Text(
          title,
          maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: kWhiteColor,
               fontWeight: FontWeight.bold,
                fontSize: 14
                ),
        ),
        ),
        const CircleAvatar(
      backgroundColor: kWhiteColor,
      radius: 25,
      child: CircleAvatar(
        backgroundColor: kBlackColor,
        radius: 23,
        child: Center(
          child: Icon(CupertinoIcons.play_fill,
          color: kWhiteColor,
          ),
        ),
      ),
        ),

      ],
    );
  }
}
