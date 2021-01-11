import 'package:flutter/material.dart';
import '../model/theme_model.dart';
import 'package:provider/provider.dart';
import '../pages/pages.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: Theme.of(context).accentColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              'about me',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(
                        title: 'about me',
                      )));
            },
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              'projects',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20.0,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Projects(
                        title: 'projects',
                      )));
            },
          ),
          SizedBox(
            width: 20,
          ),
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return IconButton(
                icon: Icon(
                  themeModel.isDark ? Icons.nightlight_round : Icons.wb_sunny,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  themeModel.switchTheme();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
