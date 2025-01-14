import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/presentation/downloads/widgets/main_page/widgets/screen_main_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
   debugShowCheckedModeBanner: false,
      title: 'Netflix', 
      theme: ThemeData(
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: const TextTheme(
        bodyLarge:TextStyle(color: Colors.white),
       bodyMedium:TextStyle(color: Colors.white)
      ),
      ),
      home:  ScreenMainPage(),
    );
 }
}