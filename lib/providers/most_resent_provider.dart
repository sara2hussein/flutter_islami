import 'package:flutter/material.dart';
import 'package:flutter_islami/utils/shared_prefrances.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostResentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];
  
void refreshMostResentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentListAsString =
      prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
  mostRecentList =
      mostRecentListAsString.map((element) => int.parse(element)).toList();
 notifyListeners();
}
void updateMostReasentIndecatorList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList =
      prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    mostRecentIndicesList.remove('$newSuraIndex');
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  } else {
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  }
  if (mostRecentIndicesList.length > 5) {
    mostRecentIndicesList.removeLast();
  }
  await prefs.setStringList(PrefKeys.mostRecentKey, mostRecentIndicesList);
}

}