import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/constants.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';
import 'package:netflix_api/presentation/search/widget/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool isListview = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
                
              ),
              style: const TextStyle(color: Colors.white),
              onTap: (){
                setState(() {
                  isListview=false;
                });
              },
              // // onSubmitted: (value){
              // //   if(value.isEmpty){
              // //     isListview =true;
              // //   }
              // },
            ),
            kHeigth,
              Expanded(child: isListview==true?const SearchIdle():const SearchResultWidget()),
                       
                      

          ],
        ),
      )),
    );
  }
}
