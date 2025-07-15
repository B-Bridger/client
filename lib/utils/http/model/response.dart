import 'package:client/models/user.dart';

class GeneralResponse {
  final String message;
  final int statusCode;
  String? detail;

  GeneralResponse({
    required this.message,
    required this.statusCode,
    this.detail = null,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      message: json["message"] as String,
      statusCode: json["status"] as int,
      detail: json["detail"] != null ? json["detail"] as String : null,
    );
  }
}

class ResponseWithUser {
  final String message;
  final int statusCode;
  String? detail;
  User? user;

  ResponseWithUser({
    required this.message,
    required this.statusCode,
    this.detail = null,
    this.user = null,
  });

  factory ResponseWithUser.fromJson(Map<String, dynamic> json) {
    return ResponseWithUser(
      message: json["message"] as String,
      statusCode: json["status"] as int,
      detail: json["detail"] != null ? json["detail"] as String : null,
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
    );
  }
}

class ResponseWithUserAndToken {
  final String message;
  final int statusCode;
  String? detail;
  User? user;
  String? token;

  ResponseWithUserAndToken({
    required this.message,
    required this.statusCode,
    this.detail = null,
    this.user = null,
    this.token = null,
  });

  factory ResponseWithUserAndToken.fromJson(Map<String, dynamic> json) {
    return ResponseWithUserAndToken(
      message: json["message"] as String,
      statusCode: json["status"] as int,
      detail: json["detail"] != null ? json["detail"] as String : null,
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      token: json["token"] != null ? json["token"] as String : null,
    );
  }
}
