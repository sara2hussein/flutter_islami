import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/tabs/quran/most_recent_widget.dart';
import 'package:flutter_islami/UI/tabs/quran/quran_resourses.dart';
import 'package:flutter_islami/UI/tabs/quran/sura_details_screen.dart';
import 'package:flutter_islami/UI/tabs/quran/sura_list_widget.dart';
import 'package:flutter_islami/providers/most_resent_provider.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_colors.dart';
import 'package:flutter_islami/utils/app_styles.dart';
import 'package:flutter_islami/utils/shared_prefrances.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
  @override
  _QuranTabState createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterIndicesList = List.generate(
    114,
    (index) => index,
  );
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<MostResentProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (newText) {
              filterIndicesListByNewText(newText);
            },
            style: AppStyles.bold20White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.searchIcon),
                color: AppColors.primaryColor,
              ),
              hintText: "Sura Name",
              hintStyle: AppStyles.bold16White,
            ),
          ),
          /////////
          MostRecentWidget(),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            'Suras List',
            style: AppStyles.bold16White,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    provider.updateMostReasentIndecatorList(filterIndicesList[index]);
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: filterIndicesList[index]);
                  },
                  child: SuraListWidget(index: filterIndicesList[index]));
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                child: Divider(
                  color: AppColors.WhiteColor,
                  thickness: 2,
                ),
              );
            },
            itemCount: filterIndicesList.length,
          )),
        ],
      ),
    );
  }

  void filterIndicesListByNewText(String newText) {
    List<int> filterList = [];
    for (int i = 0; i < QuranResourses.surahNamesEnglish.length; i++) {
      if (QuranResourses.surahNamesEnglish[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterList.add(i);
      } else if (QuranResourses.surahNamesArabic[i].contains(newText)) {
        filterList.add(i);
      }
    }
    setState(() {
      filterIndicesList = filterList;
    });
  }
}
