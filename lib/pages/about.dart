import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to my portfolio!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          'Ravi Horo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "Flutter Developer",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('GitHub'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Resume',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber,
                          Colors.pink,
                          Colors.purple,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          'assets/assets/dp.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Made With ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                Text(
                  ' Using Flutter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

// class About extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xff213A50),
//             Color(0xff071930),
//           ],
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 250,
//             width: 250,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight,
//                 colors: [
//                   Colors.amber,
//                   Colors.purple,
//                 ],
//               ),
//               border: Border.all(),
//               borderRadius: BorderRadius.circular(300),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(5),
//               child: CircleAvatar(
//                 //radius: 100,
//                 backgroundImage: AssetImage(
//                   'assets/assets/profile.png',
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             'Ravi Horo',
//           ),
//           Text(
//             "Flutter Developer based in India",
//           ),
//           Text('#FLUTTERDEV'),
//           Row(
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 child: Text('GitHub'),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Resume',
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text('Made with '),
//               Icon(
//                 Icons.favorite,
//                 color: Colors.pink,
//               ),
//               Text('Using Flutter'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
