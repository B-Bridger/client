class User {
  final String userID;
  final String email;
  final String name;
  final String language;
  final DateTime createdAt;
  final String profile;
  final String fcmToken;

  User({
    required this.userID,
    required this.email,
    required this.name,
    required this.language,
    required this.createdAt,
    required this.profile,
    required this.fcmToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json["userID"] as String,
      email: json["email"] as String,
      name: json["name"] as String,
      language: json["language"] as String,
      createdAt: DateTime.parse(json["createdAt"] as String),
      profile: json["profile"] as String,
      fcmToken: json["fcmToken"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userID": userID,
      "email": email,
      "name": name,
      "language": language,
      "createdAt": createdAt,
      "profile": profile,
      "fcmToken": fcmToken,
    };
  }

  User copyWith({
    String? userID,
    String? name,
    String? email,
    String? language,
    DateTime? createdAt,
    String? profile,
    String? fcmToken,
  }) {
    return User(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      email: email ?? this.email,
      language: language ?? this.language,
      createdAt: createdAt ?? this.createdAt,
      profile: profile ?? this.profile,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
