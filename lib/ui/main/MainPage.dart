import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("http://tagout.co.kr/data/file/site_logo3.png"),
        Center(
          heightFactor: 13,
          child: Text("Hello Tagout2"),
        ),
      ],
    );
  }
}
