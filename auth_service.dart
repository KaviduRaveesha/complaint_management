import 'dart:async';

class AuthService {
  Future<bool> login(String username, String password) async {

    await Future.delayed(Duration(seconds: 2));

    return true;
  }
}
