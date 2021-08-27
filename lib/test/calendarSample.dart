import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'CalenderClient.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calendar App',
    debugShowCheckedModeBanner: true,
    home: Home(),
  ));
}


// https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=491928665866-0i0psm70t3cq7fb39nurjc9c7l35lmrq.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A41983&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&state=authcodestate1630087440238
// https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=491928665866-0i0psm70t3cq7fb39nurjc9c7l35lmrq.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A41983&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&state=authcodestate1630087440238


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CalendarClient calendarClient = CalendarClient();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context, showTitleActions: true, minTime: DateTime(2019, 3, 5), maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.startTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event Start Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context, showTitleActions: true, minTime: DateTime(2019, 3, 5), maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.endTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event End Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$endTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'Enter Event name'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Insert Event',
              ),
              color: Colors.grey,
              onPressed: () {
                //log('add event pressed');
                calendarClient.insert(
                  _eventName.text,
                  startTime,
                  endTime,
                );
              }),
        ],
      ),
    );
  }
}
