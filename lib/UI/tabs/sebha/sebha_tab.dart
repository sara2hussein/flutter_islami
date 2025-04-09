import 'package:flutter/material.dart';
import 'package:flutter_islami/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count = (count < 33) ? count + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          textAlign: TextAlign.center,
          style: AppStyles.bold20White.copyWith(fontSize: 36),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/Group_8.png",
              width: width * 0.9,
              height: height * 0.5,
            ),
            GestureDetector(
              onTap: incrementCount,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(height: height * 0.09),
                    Text(
                      'سبحان الله',
                      style: AppStyles.bold20White.copyWith(fontSize: 36),
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      '$count',
                      style: AppStyles.bold20White.copyWith(fontSize: 36),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
