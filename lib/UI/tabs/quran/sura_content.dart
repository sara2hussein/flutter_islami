import 'package:flutter/material.dart';
import 'package:flutter_islami/utils/app_colors.dart';
class SuraContent extends StatelessWidget {
  final String suracontent;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const SuraContent({
    Key? key,
    required this.suracontent,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: height * 0.02),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Text(
          '$suracontent [${index + 1}]',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
