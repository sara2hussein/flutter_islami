import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/tabs/hadeth/hadeth_tab.dart';
import 'package:flutter_islami/UI/tabs/quran/quran_tab.dart';
import 'package:flutter_islami/UI/tabs/radio/radio_tab.dart';
import 'package:flutter_islami/UI/tabs/sebha/sebha_tab.dart';
import 'package:flutter_islami/UI/tabs/time/time_tab.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.iconQuran,
    AppAssets.iconHadeth,
    AppAssets.iconSebha,
    AppAssets.iconRadio,
    AppAssets.iconTime
  ];
  List<Widget> tabsList = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          //"assets/images/0a577dd0d3a402137b037d41ec924502.jpeg",
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          "assets/images/tajmahalagra.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data:
                Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              selectedItemColor: AppColors.WhiteColor,
              unselectedItemColor: AppColors.blackColor,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                _buildBottomNavItem("assets/images/VectorQ.png", "Quran", 0),
                _buildBottomNavItem("assets/images/book.png", "Hadith", 1),
                _buildBottomNavItem("assets/images/Sebha.png", "Sebha", 2),
                _buildBottomNavItem("assets/images/radio.png", "Radio", 3),
                _buildBottomNavItem("assets/images/VectorH.png", "Time", 4),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabsList[selectedIndex])
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(
      String imagePath, String label, int index) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(imagePath)),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackBgColor,
        ),
        child: ImageIcon(
          AssetImage(imagePath),
          color: Colors.white,
        ),
      ),
      label: label,
    );
  }
}
