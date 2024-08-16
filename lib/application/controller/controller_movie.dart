
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:netflix_api/application/model/movie_model.dart';
int retries = 3;
int count = 0;
String ar="7b72b4840a672ac97fa5d21ef0a54d25";
class MovieServices{
  static const String _popular = "https://api.themoviedb.org/3/movie/popular?api_key=7b72b4840a672ac97fa5d21ef0a54d25";

static const String _nowplaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=7b72b4840a672ac97fa5d21ef0a54d25";
static const String _toprated="https://api.themoviedb.org/3/movie/top_rated?api_key=7b72b4840a672ac97fa5d21ef0a54d25";
static const String _upcoming="https://api.themoviedb.org/3/movie/upcoming?api_key=7b72b4840a672ac97fa5d21ef0a54d25";


static Future<List<Movie>> getMovies(String url)async{
int currentRetries =0;
while(currentRetries <retries){
  try{
    final response =await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print(response.statusCode);
      List<dynamic> data =jsonDecode(response.body)['results'];
      return data.map((json)=>Movie.fromJson(json)).toList();
    }else{
      print('failed to load data: ${response.statusCode}');
    }
  }catch(e){
    print('Error caugth is $e');
  }
  currentRetries++;
}
return [];

}
static Future<List<Movie>> getNowpopular()async{
  return getMovies(_popular);
}
 static Future<List<Movie>> getNowPlaying() async {
    return getMovies(_nowplaying);
  }

  static Future<List<Movie>> getTopRated() async {
    return getMovies(_toprated);
  }

  static Future<List<Movie>> getUpcoming() async {
    return getMovies(_upcoming);
  }
}