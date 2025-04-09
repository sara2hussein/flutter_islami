import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_islami/UI/tabs/hadeth/hadeth_model.dart';
import 'package:flutter_islami/utils/app_assets.dart';
import 'package:flutter_islami/utils/app_colors.dart';
import 'package:flutter_islami/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  @override
  int index;
  HadethItem({required this.index});

  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
  @override
  void initState() {
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(
              AppAssets.Hadeth_Bg,
            ),
            fit: BoxFit.fill),
      ),
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.blackBgColor,
            ))
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  hadeth?.title ?? "",
                  textAlign: TextAlign.center,
                  style: AppStyles.bold20White.copyWith(color: Colors.black),
                ),
                SizedBox(height: height * 0.01),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? "",
                      textAlign: TextAlign.center,
                      style: AppStyles.bold16Black,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void loadHadethFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/hadeth/h$index.txt');
    int fileLinesIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLinesIndex);
    String content = fileContent.substring(fileLinesIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
