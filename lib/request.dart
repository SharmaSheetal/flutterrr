// import 'dart:convert';
//
// import 'package:http/http.dart';
//
// class ApiProvider {
//   final String url = "http://localhost:5000";
//   Future<String> getData() async {
//     // Response response = await get(url);
//     Response response = await get(url as Uri);
//     if (response.statusCode == 200) {
//       final body = response.body;
//       final res = jsonDecode(body);
//       return res;
//     } else {
//       return jsonDecode(json.decode(response.body));
//     }
//   }
// }
// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// Future<http.Response> fetchAlbum() {
//   return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
// }
//
// class Album {
//   final int userId;
//   final int id;
//   final String title;
//
//   Album({@required this.userId, @required this.id, @required this.title});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }
//
// Future<Album> fetchAlbum() async {
//   final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
// import 'package:http/http.dart';
// Future getData(url) async {
//   final response = await get(url);
//   return response.body;
// }
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String url = 'http://10.0.2.2:5000';
  var client = http.Client();

  Future<void> funcName() async {
    try {
      var response = await client.get(Uri.parse(url + '/user'));
      print(json.decode(response.body));
    } catch (e) {
      print(e);
    }
  }
}