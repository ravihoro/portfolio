import 'package:flutter/material.dart';
import '../model/theme_model.dart';
import 'package:provider/provider.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text(
              'about',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              'projects',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('projects');
            },
          ),
          Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return FlatButton(
                child: Text(
                  'Change Theme',
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
