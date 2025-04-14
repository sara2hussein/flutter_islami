import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/tabs/hadeth/hadeth_iteam.dart';

class HadethTab extends StatefulWidget {
  @override
  _HadethTabState createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.03),
      child: CarouselSlider(
        options: CarouselOptions(
          height: height * 0.75,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
        items: List.generate(50, (index) => index + 1).map((i) {
          return HadethItem(
            index: i,
          );
        }).toList(),
      ),
    );
  }
}
