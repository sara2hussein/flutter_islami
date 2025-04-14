import 'package:flutter/material.dart';
import 'package:flutter_islami/UI/home_screen.dart';
import 'package:flutter_islami/UI/intro_screen.dart';
import 'package:flutter_islami/UI/splashView.dart';
import 'package:flutter_islami/UI/tabs/quran/sura_details_screen.dart';
import 'package:flutter_islami/providers/most_resent_provider.dart';
import 'package:flutter_islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MostResentProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        IntroScreen.routName: (context) => IntroScreen(),
        HomeScreen.routName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
