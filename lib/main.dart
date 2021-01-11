import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/theme_model.dart';
import './pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            title: 'Portfolio',
            debugShowCheckedModeBanner: false,
            themeMode: themeModel.currentTheme(),
            theme: ThemeData(
              bottomAppBarColor: Colors.grey[300],
              primaryColor: Colors.white,
              accentColor: Colors.black,
              fontFamily: 'Courgette',
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.black,
              accentColor: Colors.white,
              bottomAppBarColor: Colors.black38,
              fontFamily: 'Courgette',
            ),
            home: HomePage(title: 'about me'),
          );
        },
      ),
    );
  }
}
