import 'package:flutter/material.dart';
import '../pages/pages.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({@required this.title});

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
          SizedBox(
            height: 20,
          ),
          CustomBody(
            desktopLayoutWidget: desktopLayoutWidget(width),
            mobileLayoutWidget: mobileLayoutWidget(width),
          ),
        ],
      ),
    );
  }

  Widget desktopLayoutWidget(double width) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.red,
              width: width * 0.3,
              child: CircleAvatar(
                radius: width * .11,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1602471615287-d733c59b79c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80',
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: Container(
            //color: Colors.green,
            padding: EdgeInsets.only(right: width * 0.05),
            width: width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, my name is Ravi Horo. I'm a budding Flutter developer. Welcome to my personal website.",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                customRow('Language', ['Dart', 'Java', 'SQL']),
                customRow('Framework', ['Flutter']),
                customRow('VCS', ['Git']),
                customRow('Certification', ['CCNA', 'Devnet']),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget customRow(String title, List<String> str) {
    return Row(
      children: [
        Text('$title: '),
        chipList(str),
      ],
    );
  }

  Widget mobileLayoutWidget(double width) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: width * .2,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1602471615287-d733c59b79c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1051&q=80',
            ),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Hi, my name is Ravi Horo. I\'m a budding Flutter developer. Welcome to my personal website.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Text('Language:'),
        chipList(['Dart', 'Java', 'SQL']),
        Text('Framework:'),
        chipList(['Flutter']),
        Text('VCS:'),
        chipList(['Git']),
        Text('Certification: '),
        chipList(['CCNA', 'Devnet']),
      ],
    );
  }

  Widget chipList(List<String> labels) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: [for (String s in labels) _buildChip(s)],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
      ),
    );
  }
}
