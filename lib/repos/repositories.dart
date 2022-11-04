import 'dart:convert';

import 'package:findlater/utils/config.dart';
import 'package:http/http.dart';

import '../models/user_model.dart';

class UserRegisterRepository{
  String endpoint = Config.loginUser;
  registerUser(String name, String email) async {
    Response response = await post(
      Uri.parse(endpoint),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
      }),
    );

    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class UserLoginRepository {
  String endpoint = Config.loginUser;
  getUser() async {
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}