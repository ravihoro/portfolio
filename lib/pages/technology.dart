import 'package:flutter/material.dart';

class Technology extends StatelessWidget {
  TextStyle style = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Languages',
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoContainer(
                name: "Dart",
                image: 'assets/assets/dart_logo.jpg',
              ),
              SizedBox(
                width: 20,
              ),
              LogoContainer(
                name: "Java",
                image: 'assets/assets/java_logo.jpg',
              ),
              SizedBox(
                width: 20,
              ),
              LogoContainer(
                name: "JavaScript",
                image: 'assets/assets/js_logo.png',
              ),
              SizedBox(
                width: 20,
              ),
              LogoContainer(
                name: "SQL",
                image: 'assets/assets/sql_logo.png',
              ),
            ],
          ),
          Text(
            'Framework',
            style: style,
          ),
          LogoContainer(
            name: "Flutter",
            image: 'assets/assets/flutter_logo.jpg',
          ),
          Text(
            'Databases',
            style: style,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoContainer(
                name: "SQLite",
                image: 'assets/assets/sqlite_logo.png',
              ),
              SizedBox(
                width: 20,
              ),
              LogoContainer(
                name: "Cloud Firestore",
                image: 'assets/assets/firestore_logo.png',
              ),
              SizedBox(
                width: 20,
              ),
              LogoContainer(
                name: "Mongo DB",
                image: 'assets/assets/mongodb_logo.jpg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LogoContainer extends StatefulWidget {
  final String image;
  final String name;

  LogoContainer({
    this.name,
    this.image,
  });

  @override
  _LogoContainerState createState() => _LogoContainerState();
}

class _LogoContainerState extends State<LogoContainer> {
  bool exit = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          exit = false;
        });
      },
      onExit: (value) {
        setState(() {
          exit = true;
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 200,
            ),
            height: exit ? 100 : 110,
            width: exit ? 100 : 110,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  widget.image,
                ),
              ),
            ),
          ),
          Text(
            widget.name,
          ),
        ],
      ),
    );
  }
}
