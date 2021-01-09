import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model/theme_model.dart';

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
              primaryColor: Colors.yellow,
              fontFamily: 'Courgette',
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.black,
              bottomAppBarColor: Colors.black38,
              fontFamily: 'Courgette',
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainer(),
          CustomBody(),
        ],
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * .2,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1602471615287-d733c59b79c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80',
          ),
        ),
        Container(
          child: Flexible(
            child: Text(
              "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.3,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * .11,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1602471615287-d733c59b79c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80',
            ),
          ),
        ),
        Container(
          color: Colors.green,
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
          width: MediaQuery.of(context).size.width * 0.7,
          child: Flexible(
            child: Text(
              "What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.of(context).size.width > 900
          ? DesktopLayout()
          : MobileLayout(),
    );
  }
}

class CustomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'about',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'projects',
            style: TextStyle(
              color: Colors.white,
            ),
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
