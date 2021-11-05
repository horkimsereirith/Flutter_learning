import 'dart:convert';

// import 'dart:ffi';

LoginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  String token = "";
  int statusCode = 500;
  bool isSuccess = false;
  String error = "";
  late Data data;

  LoginResponseModel(
      {required this.token,
      required this.error,
      required this.isSuccess,
      required this.statusCode});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    token = json['token'];
    error = json['error'];
    statusCode = json['statusCode'];
    data = (json['data'].length > 0 ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['statusCode'] = statusCode;
    data['token'] = token;
    data['error'] = error;

    return data;
  }
}

class Data {
  String token = '';
  String id = '';
  String email = '';
  String username = '';

  Data(
      {required this.token,
      required this.id,
      required this.email,
      required this.username});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    return data;
  }
}


// class LoginRequestModel {
//   String username;
//   String password;

//   LoginRequestModel({required this.username, required this.password});

//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//       'username': username.trim(),
//       'password': password.trim()
//     };

//     return map;
//   }
// }
