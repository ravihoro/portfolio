import 'package:flutter/material.dart';
import 'package:portfolio/pages/project_page.dart';
import 'package:portfolio/pages/sidebar.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Widget _currentPage = ProjectPage();

  setCurrentPage(currentPage) {
    setState(() {
      _currentPage = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SideBar(
          setCurrentPage: setCurrentPage,
        ),
        _currentPage,
      ],
    );
  }
}
