import 'package:flutter/material.dart';
import '../model/theme_model.dart';
import 'package:provider/provider.dart';
import '../pages/pages.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'about me',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(
                        title: 'about me',
                      )));
            },
          ),
          ListTile(
            title: Text(
              'projects',
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Projects(
                        title: 'projects',
                      )));
            },
          ),
          ListTile(
            title: Text(
              'theme',
            ),
            trailing: Consumer<ThemeModel>(
              builder: (context, themeModel, child) {
                return Switch(
                  value: themeModel.isDark,
                  activeColor: Theme.of(context).accentColor,
                  onChanged: (value) {
                    themeModel.switchTheme();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
