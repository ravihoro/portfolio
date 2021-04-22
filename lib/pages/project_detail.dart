import 'package:flutter/material.dart';
import '../model/project.dart';
import './pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectDetail extends StatelessWidget {
  final Project project;
  final String title;

  ProjectDetail({@required this.project, @required this.title});

  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: width < 900 ? CustomAppBar(title: title) : null,
      //drawer: width < 900 ? CustomDrawer() : null,
      body: Column(
        children: [
          //width < 900 ? Container() : CustomHeader(),
          //width < 900 ? Container() : TitleContainer(title: project.name),
          TitleContainer(title: project.name),
          CustomBody(
            desktopLayoutWidget: desktopLayoutWidget(width, height, context),
            mobileLayoutWidget: mobileLayoutWidget(width, context),
          ),
        ],
      ),
    );
  }

  Widget desktopLayoutWidget(
      double width, double height, BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.3,
          height: height * 0.75,
          child: customImageSlider(context),
        ),
        Flexible(
          child: Container(
            width: width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customContainer('Description', [project.description]),
                SizedBox(
                  height: 15.0,
                ),
                customContainer('Features', project.features),
                SizedBox(
                  height: 15.0,
                ),
                customContainer('Tools Used', project.toolsUsed),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileLayoutWidget(double width, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: width * 0.8,
            height: 600,
            child: customImageSlider(context),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                customContainer('Description', [project.description]),
                SizedBox(
                  height: 15.0,
                ),
                customContainer('Features', project.features),
                SizedBox(
                  height: 15.0,
                ),
                customContainer('Tools Used', project.toolsUsed),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customImageSlider(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: project.images.length,
            itemBuilder: (context, index) {
              return imageSlider(index);
            },
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          child: SmoothPageIndicator(
            count: project.images.length,
            controller: pageController,
            effect: WormEffect(
              activeDotColor: Colors.black,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
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
            height: Curves.easeInOut.transform(value) * 500,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: Card(
        elevation: 10.0,
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: Image.network(
            project.images[index],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget customContainer(String title, List<String> body) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String s in body)
              Text(
                "\u2022 $s",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class TitleContainer extends StatelessWidget {
  final String title;

  TitleContainer({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.black,
        ),
        color: Colors.black,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
