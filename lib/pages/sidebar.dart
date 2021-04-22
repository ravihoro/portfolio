import 'package:flutter/material.dart';
import 'package:portfolio/pages/education.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/technology.dart';

List<String> texts = [
  'Projects',
  'Technologies',
  'Education',
];

List<Widget> pages = [
  ProjectPage(),
  Technology(),
  Education(),
];

List<IconData> icons = [
  Icons.rss_feed,
  Icons.search,
  Icons.notifications,
];

List<IconData> iconsOutline = [
  Icons.rss_feed_outlined,
  Icons.search_outlined,
  Icons.notifications_outlined,
];

class SideBar extends StatefulWidget {
  final Function(Widget) setCurrentPage;

  SideBar({this.setCurrentPage});

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String currentSelected = texts[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 15,
              bottom: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //print(currentSelected);

                    setState(() {
                      currentSelected = texts[index];
                    });
                    widget.setCurrentPage(pages[index]);
                  },
                  child: SideBarItem(
                    icon: currentSelected == texts[index]
                        ? icons[index]
                        : iconsOutline[index],
                    text: texts[index],
                    selected: currentSelected == texts[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  SideBarItem({
    this.icon,
    this.text,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: selected ? Colors.white : Colors.grey,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
            ),
          ),
          Spacer(),
          selected
              ? Container(
                  padding: EdgeInsets.zero,
                  height: 20,
                  width: 2.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.orange,
                        Colors.pink,
                        Colors.purple,
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
