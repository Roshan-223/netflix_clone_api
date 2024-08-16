import 'package:flutter/material.dart';
import 'package:netflix_api/application/controller/controller_movie.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/screen_home.dart';
import 'package:netflix_api/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix_api/presentation/new_and_hot/widget/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
   List popular = [];
  List upcoming = [];
  bool isLoading = true;
  bool isError = false;

   Future upcomingMovies() async {
    try {
      List movies = await MovieServices.getUpcoming();
      List popularMovies =
          await MovieServices.getNowPlaying(); // Fix variable shadowing
      if (mounted) {
        setState(() {
          upcoming = movies;
          popular = popularMovies; // Use the correct variable here
          isLoading = false;
        });
      }
    } catch (e) {
      print('The error is $e');
      if (mounted) {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: kWhiteColor,
                size: 30,
              ),
              kwidth,
              Container(
                height: 30,
                width: 30,
                color: Colors.blue,
              ),
              kwidth,
            ],
            bottom: TabBar(
              dividerHeight: 0,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadious30,
              ),
              tabs: const [
                Tab(
                  text: " 🍿 Coming Soon  ",
                ),
                Tab(
                  text: "👀Everyone's Watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
              Buildcomingsoon(upcoming: upcoming),
               BuildEveryone(popular: popular),
               ]),
    
        ),
      );
  }
}

class Buildcomingsoon extends StatelessWidget {
  final List upcoming;
  const Buildcomingsoon({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    if (upcoming.isEmpty) {
      return const Center(child: Text('No upcoming movies available.'));
    }
    return ListView.builder(
        itemCount: upcoming.length,
        itemBuilder: (context, index) => ComingSoonWidget(
             releaseDate: upcoming[index].releaseDate,
              image: imageBase + upcoming[index].imagePath,
              title: upcoming[index].title,
              desc: upcoming[index].overview,
             
            ));
  }
}



class BuildEveryone extends StatelessWidget {
  final List popular;
  const BuildEveryone({super.key, required this.popular});

  @override
  Widget build(BuildContext context) {
    if (popular.isEmpty) {
      return const Center(child: Text('No popular movies available.'));
    }
    return ListView.builder(
        itemCount: popular.length,
        itemBuilder: (context, index) => EveryonesWatching(
              image: imageBase + popular[index].imagePath,
              moviename: popular[index].title,
              desc: popular[index].overview,
            ));
  }
}