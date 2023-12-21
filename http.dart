import 'package:http/http.dart' as http;
import 'dart:convert';

// ...

Future<void> _registerUser(String username, String email, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost/api.php/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('User registered successfully');
  } else {
    print('Failed to register user. Error: ${response.body}');
  }
}
