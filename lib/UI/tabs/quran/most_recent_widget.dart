import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/tabs/quran/quran_resourses.dart';
import 'package:flutter_islami/providers/most_resent_provider.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_colors.dart';
import 'package:flutter_islami/utils/app_styles.dart';
import 'package:flutter_islami/utils/shared_prefrances.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({Key? key}) : super(key: key);
  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostResentProvider provider;
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshMostResentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostResentProvider>(context);
    return Visibility(
      visible: provider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Most Recently',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            width: double.infinity,
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: width * 0.02);
              },
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.70,
                  height: height * 0.16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: width * 0.05,
                        top: height * 0.03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResourses.surahNamesEnglish[
                                  provider.mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              QuranResourses.surahNamesArabic[
                                  provider.mostRecentList[index]],
                              style: AppStyles.bold16Black,
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              '${QuranResourses.surahVerses[provider.mostRecentList[index]]} Verses',
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: width * 0.02,
                        bottom: height * 0.02,
                        child: Image.asset(
                          AppAssets.mostIcon,
                          fit: BoxFit.cover,
                          width: width * 0.30,
                          height: height * 0.15,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: provider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
