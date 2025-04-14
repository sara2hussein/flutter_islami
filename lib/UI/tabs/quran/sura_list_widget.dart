import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/tabs/quran/quran_resourses.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_styles.dart';

class SuraListWidget extends StatelessWidget {
  int index;
  SuraListWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.vectorImage),
              Text(
                '${index + 1}',
                style: AppStyles.bold16White,
              ),
            ],
          ),
          SizedBox(
            width: width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResourses.surahNamesEnglish[index],
                style: AppStyles.bold20White,
              ),
              Text(
                '${QuranResourses.surahVerses[index]} Verses',
                style: AppStyles.bold14White,
              ),
            ],
          ),
          Spacer(),
          Text(
            QuranResourses.surahNamesArabic[index],
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
