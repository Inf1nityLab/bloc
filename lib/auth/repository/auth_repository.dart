import 'dart:convert';

import 'package:http/http.dart' as http;
import '../data/data.dart';

class AuthRepository {


  Future<AuthResponse> login(username, password) async {
    final response = await http.post(
      Uri.parse('https://your-api-url/login'),
      body: {'username': username, 'password': password, },
    );

    if (response.statusCode == 200) {
      return AuthResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logout() async {
    // Implement logout logic
  }
}