import 'package:flutter/material.dart';
import 'package:portfolio/pages/pages.dart';
import '../model/project.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width - 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProjectDetail(
                              project: projects[0],
                              title: projects[0].name,
                            )));
                  },
                  child: ProjectCard(
                    text: projects[0].name,
                    icon: projects[0].icon,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProjectDetail(
                              project: projects[1],
                              title: projects[1].name,
                            )));
                  },
                  child: ProjectCard(
                    text: projects[1].name,
                    icon: projects[1].icon,
                    color: Colors.blue,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProjectDetail(
                              project: projects[2],
                              title: projects[2].name,
                            )));
                  },
                  child: ProjectCard(
                    text: projects[2].name,
                    icon: projects[2].icon,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String text;
  final Color color;
  final IconData icon;
  final int index;

  ProjectCard({
    this.text,
    this.color,
    this.icon,
    this.index,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool exit = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: MouseRegion(
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: exit ? 220 : 240,
          width: exit ? 200 : 220,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: exit ? Colors.grey : Colors.transparent,
              ),
              boxShadow: exit
                  ? []
                  : [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 20,
                        color: widget.color,
                      ),
                    ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: exit ? 50 : 60,
                width: exit ? 50 : 60,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.color,
                  ),
                  color: exit ? Colors.white : widget.color,
                  borderRadius: BorderRadius.circular(exit ? 15 : 20),
                ),
                child: Icon(
                  widget.icon,
                  size: 25,
                  color: exit ? widget.color : Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                padding: const EdgeInsets.all(3),
                duration: Duration(
                  milliseconds: 200,
                ),
                height: exit ? 26 : 28,
                decoration: BoxDecoration(
                  color: exit ? Colors.white : widget.color,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: exit ? Colors.white : widget.color,
                  ),
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 16,
                    color: exit ? Colors.black : Colors.white,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
