import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  final Widget desktopLayoutWidget;

  DesktopLayout({@required this.desktopLayoutWidget});

  @override
  Widget build(BuildContext context) {
    return desktopLayoutWidget;
  }
}

class MobileLayout extends StatelessWidget {
  final Widget mobileLayoutWidget;

  MobileLayout({@required this.mobileLayoutWidget});

  @override
  Widget build(BuildContext context) {
    return mobileLayoutWidget;
  }
}

class CustomBody extends StatelessWidget {
  final Widget desktopLayoutWidget;
  final Widget mobileLayoutWidget;

  CustomBody(
      {@required this.desktopLayoutWidget, @required this.mobileLayoutWidget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.of(context).size.width > 900
          ? DesktopLayout(
              desktopLayoutWidget: desktopLayoutWidget,
            )
          : MobileLayout(
              mobileLayoutWidget: mobileLayoutWidget,
            ),
    );
  }
}
