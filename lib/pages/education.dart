import 'package:flutter/material.dart';

double dotSize = 20;
double gap = 130;
double iconSize = 30;
double detailContainerWidth = 300 + 7.0;

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  bool animated = false;
  bool animateCards = false;

  start() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      animated = true;
    });
    await Future.delayed(Duration(milliseconds: 1100));
    setState(() {
      animateCards = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double centreDot = ((size.width - 300) / 2) - dotSize / 2;
    double centreIcon = ((size.width - 300) / 2) - iconSize / 2;
    return Container(
      height: size.height,
      width: size.width - 300,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: animated ? 0 : size.height,
            //bottom: 0,
            left: centreIcon,
            child: EducationLine(),
          ),
          AnimatedPositioned(
            duration: Duration(
              milliseconds: 800,
            ),
            top: animated ? gap : size.height,
            left: centreDot - detailContainerWidth,
            child: TimeLineDot(
              color: Colors.purple,
              delay: const Duration(milliseconds: 1200),
              displayCard: animateCards,
              title: "Master of Computer Applications (MCA)",
              school: "NITK Surathkal",
              year: "2017 - 2020",
            ),
          ),
          AnimatedPositioned(
            duration: Duration(
              milliseconds: 900,
            ),
            top: animated ? 2 * gap : size.height,
            left: centreDot,
            child: TimeLineDot(
              color: Colors.amber,
              left: false,
              delay: const Duration(milliseconds: 1400),
              displayCard: animateCards,
              title: "Bachelor of Science in Information Technology (BSc IT)",
              school: "St. Xavier's College, Ranchi",
              year: "2014 - 2017",
            ),
          ),
          AnimatedPositioned(
            duration: Duration(
              milliseconds: 1000,
            ),
            top: animated ? 3 * gap : size.height,
            left: centreDot - detailContainerWidth,
            child: TimeLineDot(
              color: Colors.blue,
              delay: const Duration(milliseconds: 1600),
              displayCard: animateCards,
              title: "Class 12",
              school: "DAV Public School, Hehal",
              year: "2013",
            ),
          ),
          AnimatedPositioned(
            duration: Duration(
              milliseconds: 1100,
            ),
            top: animated ? 4 * gap : size.height,
            left: centreDot,
            child: TimeLineDot(
              left: false,
              color: Colors.green,
              delay: const Duration(milliseconds: 1800),
              displayCard: animateCards,
              title: "Class 10",
              school: "DAV Public School, Hehal",
              year: "2011",
            ),
          ),
        ],
      ),
    );
  }
}

class EducationLine extends StatefulWidget {
  @override
  _EducationLineState createState() => _EducationLineState();
}

class _EducationLineState extends State<EducationLine> {
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height - 50;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.school,
          size: iconSize,
          //color: Colors.red,
        ),
        Container(
          height: maxHeight,
          width: 3,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class TimeLineDot extends StatefulWidget {
  final Color color;
  final bool displayCard;
  final bool left;
  final Duration delay;

  final String title;
  final String school;
  final String year;

  TimeLineDot({
    this.color,
    this.displayCard = false,
    this.left = true,
    this.delay,
    this.title,
    this.school,
    this.year,
  });

  @override
  _TimeLineDotState createState() => _TimeLineDotState();
}

class _TimeLineDotState extends State<TimeLineDot> {
  bool animate = false;

  void _animateWithDelay() async {
    await Future.delayed(widget.delay);
    setState(() {
      animate = true;
    });
  }

  @override
  void didUpdateWidget(TimeLineDot oldWidget) {
    _animateWithDelay();
    super.didUpdateWidget(oldWidget);
  }

  Widget _dot() {
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[100],
        ),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: widget.color,
        ),
      ),
    );
  }

  Widget _line() {
    return animate
        ? Container(
            height: 1,
            width: 5,
            color: Colors.red,
          )
        : Container(
            height: 1,
            width: 5,
          );
  }

  Widget _details() {
    return animate
        ? Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  widget.school,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  widget.year,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        : Container(
            height: 100,
            width: 300,
          );
  }

  @override
  Widget build(BuildContext context) {
    return widget.left
        ? Row(
            children: [
              _details(),
              SizedBox(
                width: 2,
              ),
              _line(),
              _dot(),
            ],
          )
        : Row(
            children: [
              _dot(),
              _line(),
              SizedBox(
                width: 2,
              ),
              _details(),
            ],
          );
  }
}
