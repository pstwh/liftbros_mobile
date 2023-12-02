import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  String? _sessionToken;

  String? get sessionToken => _sessionToken;

  Future<void> saveSessionToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_token', token);
    _sessionToken = token;
  }

  Future<void> retrieveSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _sessionToken = prefs.getString('session_token');
  }

  Future<void> clearSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_token');
    _sessionToken = null;
  }
}
