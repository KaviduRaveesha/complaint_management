import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://your-api-domain.com'; // Replace with your API domain

  Future<bool> login(String username, String password) async {
    final String loginUrl = '$baseUrl/login'; // Replace with your login endpoint

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Successful login
        return true;
      } else {
        // Failed login
        return false;
      }
    } catch (error) {
      // Handle any errors that occurred during the API call
      print('Error during login: $error');
      return false;
    }
  }

  Future<bool> register(String email, String nic, String password) async {
    final String registerUrl = '$baseUrl/register'; // Replace with your registration endpoint

    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        body: {'email': email, 'nic': nic, 'password': password},
      );

      if (response.statusCode == 200) {
        // Successful registration
        return true;
      } else {
        // Failed registration
        return false;
      }
    } catch (error) {
      // Handle any errors that occurred during the API call
      print('Error during registration: $error');
      return false;
    }
  }

  // You can add more methods for handling authentication, such as logout or password reset.

  // Example of how to handle token-based authentication (if applicable)
  String? authToken;

  void setAuthToken(String token) {
    authToken = token;
  }

  void clearAuthToken() {
    authToken = null;
  }

// You can add methods for refreshing the token or checking token expiration as needed.
}
