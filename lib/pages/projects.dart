import 'package:flutter/material.dart';
import '../pages/pages.dart';
import '../model/project.dart';
import 'package:provider/provider.dart';
import '../model/theme_model.dart';

class Projects extends StatelessWidget {
  final String title;

  Projects({@required this.title});

  final List<Project> projects = ProjectsList().projects;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: width < 900 ? CustomAppBar(title: title) : null,
      drawer: width < 900 ? CustomDrawer() : null,
      body: Column(
        children: [
          width < 900 ? Container() : CustomHeader(),
          CustomBody(
            desktopLayoutWidget: desktopLayoutWidget(),
            mobileLayoutWidget: mobileLayoutWidget(),
          ),
        ],
      ),
    );
  }

  Widget desktopLayoutWidget() {
    return GridView.builder(
      itemCount: projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, mainAxisSpacing: 10.0, crossAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        return CustomCard(project: projects[index]);
      },
    );
  }

  Widget mobileLayoutWidget() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        mainAxisSpacing: 15.0,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return CustomCard(
          project: projects[index],
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final Project project;

  CustomCard({@required this.project});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    bool val = themeModel.isDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        child: Card(
          elevation: 5.0,
          shadowColor: val ? Colors.white : Colors.black,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        project.images[0],
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  project.name,
                  textAlign: TextAlign.center,
                ),
                // subtitle: Text(
                //   project.description,
                //   maxLines: 3,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProjectDetail(project: project, title: project.name)));
        },
      ),
    );
  }
}
