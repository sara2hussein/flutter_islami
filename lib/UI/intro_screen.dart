import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_islami/UI/home_screen.dart';

class IntroScreen extends StatefulWidget {
  static const routName = "introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              buildPage(
                image: "assets/images/Frame3.png",
                title: "Welcome To Islami App",
                description: "",
              ),
              buildPage(
                image: "assets/images/Frame.png",
                title: "Welcome To Islami",
                description: "We Are Very Excited To Have You In Our Community",
              ),
              buildPage(
                image: "assets/images/Fram.png",
                title: "Reading the Quran",
                description: "Read, and your Lord is the Most Generous",
              ),
              buildPage(
                image: "assets/images/intro4.png",
                title: "Reading the Quran",
                description: "Read, and your Lord is the Most Generous",
              ),
              buildPage(
                image: "assets/images/intro5.png",
                title: "Bearish",
                description: "Praise the name of your Lord, the Most High",
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Group_31.png",
                  width: 150,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white54,
                    activeDotColor: Colors.amber,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 4,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex == 0
                        ? SizedBox(width: 60)
                        : TextButton(
                            onPressed: () {
                              _controller.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Back",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 16),
                            ),
                          ),
                    currentIndex == 3
                        ? TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.routName);
                            },
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 16),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xff202020),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 140),
          Image.asset(image, width: 250),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
