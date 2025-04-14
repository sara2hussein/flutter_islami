import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islami/UI/tabs/quran/quran_resourses.dart';
import 'package:flutter_islami/UI/tabs/quran/sura_content.dart';
import 'package:flutter_islami/providers/most_resent_provider.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_colors.dart';
import 'package:flutter_islami/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";

  @override
  _SuraDetailsScreenState createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostResentProvider provider;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    provider = Provider.of<MostResentProvider>(context);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResourses.surahNamesEnglish[index],
          style: AppStyles.bold20primary,
        ),
      ),
      body: Container(
        color: AppColors.blackBgColor,
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.vectorLeft),
                Text(
                  QuranResourses.surahNamesArabic[index],
                  style: AppStyles.bold24primary,
                  textAlign: TextAlign.center,
                ),
                Image.asset(AppAssets.vectorRight),
              ],
            ),
            Expanded(
              child: verses.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height * 0.01);
                      },
                      itemBuilder: (context, index) {
                        return SuraContent(
                          key: ValueKey(index),
                          suracontent: verses[index],
                          index: index,
                          isSelected: index == selectedIndex,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        );
                      },
                      itemCount: verses.length,
                    ),
            ),
            Image.asset(AppAssets.vectorBotom),
          ],
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    provider.refreshMostResentList();
  }

  void loadSuraFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');
    verses = suraLines;
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
