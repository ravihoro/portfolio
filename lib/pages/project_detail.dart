import 'package:flutter/material.dart';
import '../model/project.dart';
import './pages.dart';

class ProjectDetail extends StatefulWidget {
  final Project project;

  ProjectDetail({@required this.project});

  @override
  _ProjectDetailState createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          CustomBody(
            desktopLayoutWidget: desktopLayoutWidget(),
            mobileLayoutWidget: mobileLayoutWidget(),
          ),
        ],
      ),
    );
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200,
            width: Curves.easeInOut.transform(value) * 300,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: Image.network(
          widget.project.images[index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget desktopLayoutWidget() {
    return Row(
      children: [
        Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width * 0.3,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.project.images.length,
            itemBuilder: (context, index) {
              return imageSlider(index);
            },
          ),
        ),
        Flexible(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.project.name,
                ),
                Text(
                  widget.project.description,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileLayoutWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.7,
            height: 400,
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.project.images.length,
              itemBuilder: (context, index) {
                return imageSlider(index);
              },
            ),
          ),
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width * 0.7,
            height: 300,
            child: Column(
              children: [
                Text(
                  widget.project.name,
                ),
                Text(
                  widget.project.description,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
