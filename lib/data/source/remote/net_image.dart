import 'package:flutter/material.dart';


import 'dart:async';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: Text("Test")),
//         body: Container(
//           alignment: Alignment.center,
//           child: FutureBuilder<Widget>(
//             future: getImage(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return snapshot.data;
//               } else {
//                 return Text('LOADING...');
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<Widget> getImage() async {
//     final Completer<Widget> completer = Completer();
//
//     final url = 'https://picsum.photos/200/300';
//     final image = NetworkImage(url);
//     // final config = await image.obtainKey(const ImageConfiguration());
//     // final load = image.load();
//
//     final listener = new ImageStreamListener((ImageInfo info, isSync) async {
//       print(info.image.width);
//       print(info.image.height);
//
//       if (info.image.width == 80 && info.image.height == 160) {
//         completer.complete(Container(child: Text('AZAZA')));
//       } else {
//         completer.complete(Container(child: Image(image: image)));
//       }
//     });
//
//     load.addListener(listener);
//     return completer.future;
//   }
// }
