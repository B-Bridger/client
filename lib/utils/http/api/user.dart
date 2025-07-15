import '../model/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String host = "https://bridger.cockatoo-micro.ts.net";

Future<ResponseWithUserAndToken> login(String email, String password) async {
  Map<String, String> data = {"email": email, "password": password};

  http.Response response = await http.post(
    Uri.parse("$host/login"),
    body: json.encode(data),
  );
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return ResponseWithUserAndToken.fromJson(json.decode(responseBody));
}

Future<ResponseWithUser> register(
  String email,
  String name,
  String password,
) async {
  Map<String, String> data = {
    "email": email,
    "name": name,
    "password": password,
    "language": "ko", // FIXME: change call location
  };

  http.Response response = await http.post(
    Uri.parse("$host/users/"),
    body: json.encode(data),
  );

  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return ResponseWithUser.fromJson(json.decode(responseBody));
}
