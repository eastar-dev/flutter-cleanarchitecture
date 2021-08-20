import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  httpcall();
  // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  // var url =
  //     Uri.https('www.gccompany.co.kr', '/App/json/1.json', {'q': '{http}'});
  // var url =
  //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  developer.log("url".toString());
  // Await the http get response, then decode the json-formatted response.
  // var response = await http.get(url);
  // if (response.statusCode == 200) {
  //   var jsonResponse =
  //       convert.jsonDecode(response.body) as Map<String, dynamic>;
  //   var itemCount = jsonResponse['totalItems'];
  //   print('Number of books about http: $itemCount.');
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }
}

Future<void> httpcall() async {
  var url = Uri.parse('https://example.com/whatsit/create');
  var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  print(await http.read(Uri.parse('https://example.com/whatsit/create')));
}
