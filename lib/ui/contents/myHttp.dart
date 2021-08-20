import 'dart:async';

import 'package:flutter/material.dart';
import '../../data/source/remote/remote.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchGet("https://www.gccompany.co.kr/App/json/1.json");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: SingleChildScrollView(
          child: centerData(futureData),
        ),
      ),
    );
  }
}

FutureBuilder centerData(Future<String> future) {
  return FutureBuilder<String>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data ?? "");
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      // 기본적으로 로딩 Spinner를 보여줍니다.
      return CircularProgressIndicator();
    },
  );
}
