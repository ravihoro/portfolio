// import 'package:flutter/material.dart';
// import '../model/theme_model.dart';
// import 'package:provider/provider.dart';
// import '../pages/pages.dart';

// class CustomDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final themeModel = Provider.of<ThemeModel>(context);
//     bool val = themeModel.isDark;

//     return SafeArea(
//       child: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: val ? Colors.white : Colors.black,
//               ),
//               child: Center(
//                 child: Container(
//                   child: Text(
//                     'Portfolio',
//                     style: TextStyle(
//                       color: !val ? Colors.white : Colors.black,
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'about me',
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => HomePage(
//                           title: 'about me',
//                         )));
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'projects',
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => Projects(
//                           title: 'projects',
//                         )));
//               },
//             ),
//             ListTile(
//               title: Text(
//                 'theme',
//               ),
//               trailing: Consumer<ThemeModel>(
//                 builder: (context, themeModel, child) {
//                   return Switch(
//                     value: themeModel.isDark,
//                     activeColor: Theme.of(context).accentColor,
//                     onChanged: (value) {
//                       themeModel.switchTheme();
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
