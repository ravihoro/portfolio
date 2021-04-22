import 'package:flutter/material.dart';
import 'package:portfolio/pages/about.dart';
import '../pages/content.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double offset = 0;

  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() {
      offset = scrollNotification.metrics.pixels;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: NotificationListener<ScrollNotification>(
        onNotification: updateOffsetAccordingToScroll,
        child: Stack(
          children: [
            Positioned(
              top: -(0.25 * offset),
              child: About(),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    height: height,
                    width: width,
                    color: Colors.white,
                    child: Content(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
