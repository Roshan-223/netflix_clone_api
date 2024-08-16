import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_api/application/controller/controller_movie.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/home/widgets/background_card.dart';
import 'package:netflix_api/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_api/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_api/presentation/widgets/main_title_card.dart';

const String imageBase="https://image.tmdb.org/t/p/w500/";
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
  List popular = [];

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
    List nowplaying = [];
  List toprated = [];

  List upcoming = [];

  Future getAllmovies() async {
    nowplaying = await MovieServices.getNowPlaying();
    toprated = await MovieServices.getTopRated();
    popular = await MovieServices.getNowpopular();
    upcoming = await MovieServices.getUpcoming();
  setState(() {
  });
  }
    @override
  void initState() {
    getAllmovies();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final Size widgetsize = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children:  [
                      const BackgroundCard(),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButtonWidget(
                                title: "My List",
                                icon: Icons.add,
                              ),
                              _PlayButton(),
                              CustomButtonWidget(
                                  icon: Icons.info, title: "info")
                            ],
                          ),
                        ),
                      ),
                      MainTitleCard(
                        title: "Released in the past year",
                       widgetsize: widgetsize, 
                       movies:  nowplaying,
                      
                      ),
                      kHeigth,
                       MainTitleCard(
                        title: "Trending Now",
                        widgetsize: widgetsize,
                        movies: toprated ,
                      ),
                      kHeigth,
                       NumberTitleCard(movies: popular,),
                      kHeigth,
                       MainTitleCard(
                        title: "Tense Dramas",
                        widgetsize: widgetsize,
                       movies: upcoming,
                      
                      ),
                      kHeigth,
                       MainTitleCard(
                        title: "South Indias Cinema",
                        widgetsize: widgetsize,
                        movies: nowplaying,
                       
                      ),
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://logohistory.net/wp-content/uploads/2023/05/Netflix-Symbol.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Spacer(),
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
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Tv Shows',
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    'Movies',
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    'Categories',
                                    style: kHomeTitleText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : kHeigth,
                ],
              ),
            );
          }),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.play_arrow,
            color: kBlackColor,
          ),
          SizedBox(width: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Play',
              style: TextStyle(color: kBlackColor),
            ),
          ),
        ],
      ),
    );
  }
}

