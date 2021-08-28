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
        Image.asset('assets/logo.jpg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            heightFactor: 13,
            child: Text("Hello Tagout2"),
          ),
        ),
      ],
    );
  }
}
