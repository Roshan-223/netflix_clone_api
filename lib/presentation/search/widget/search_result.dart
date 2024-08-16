import 'package:flutter/cupertino.dart';
import 'package:netflix_api/application/controller/controller_movie.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

const pic="https://mlpnk72yciwc.i.optimole.com/cqhiHLc.IIZS~2ef73/w:auto/h:auto/q:75/https://bleedingcool.com/wp-content/uploads/2022/09/FfSdLe4UYAEexf0.jpg";
class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  List idealposters=[];
   Future idealmovies() async {
    idealposters = await MovieServices.getNowpopular();
    setState(() {});
  }
  @override
  void initState(){
    super.initState();
    idealmovies();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
   children: [
    const SearchTextTitle(title: "Movies & Tv"),
    kHeigth,
    Expanded(child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing:5,
      crossAxisSpacing: 8,
      childAspectRatio: 1/1.4,
      children:List.generate(
        idealposters.length,
         (index){
        return  MainCard(image: imageBase+idealposters[index].imagePath,);
      }
      ),
      ),
      ),
   ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration:  BoxDecoration(
    image:  DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
  borderRadius: BorderRadius.circular(7),
  ),
    );
  }
}