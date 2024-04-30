class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class AuthResponse {
  final String token;

  AuthResponse({required this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(token: json['token'] as String);
  }
}