import 'dart:io';

import 'package:googleapis/calendar/v3.dart';
import "package:googleapis_auth/auth_io.dart";

void main() {
  const _scopes = const [CalendarApi.calendarScope];

  var _credentials;

  if (Platform.isAndroid) {
    _credentials = new ClientId("491928665866-0i0psm70t3cq7fb39nurjc9c7l35lmrq.apps.googleusercontent.com", "");
  } else if (Platform.isIOS) {
    _credentials = new ClientId("491928665866-9ml0e87p5g4lsap36cgdgrf57sgb1p28.apps.googleusercontent.com", "");
  }


  // Event event = Event(); // Create object of event
  // event.summary = summaryText; //Setting summary of object
  //
  // EventDateTime start = new EventDateTime(); //Setting start time
  // start.dateTime = startTime;
  // start.timeZone = "GMT+05:00";
  // event.start = start;
  //
  //
  // EventDateTime end = new EventDateTime(); //setting end time
  // end.timeZone = "GMT+05:00";
  // end.dateTime = endTime;
  // event.end = end;
}
