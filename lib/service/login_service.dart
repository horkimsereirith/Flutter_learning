import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static var client = http.Client();
  static String apiUrl = "http://localhost:3001/api/auth/signin";

  static Future<bool> login(String username, String password) async {
    // print({username, password});
    Map<String, String> requestHeaders = {'Content-type': 'application/json'};

    var response = await client.post(Uri.parse(apiUrl),
        headers: requestHeaders,
        body: jsonEncode({"username": username, "password": password}));

    if (response.statusCode == 200) {
      // print(response.body);
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }
}
