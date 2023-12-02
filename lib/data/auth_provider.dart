import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  String? _sessionToken;
  int? _userId;

  String? get sessionToken => _sessionToken;
  int? get userId => _userId;

  bool get authenticated => _sessionToken != null;

  Future<void> saveSessionToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_token', token);
    _sessionToken = token;
  }

  Future<void> saveUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
    _userId = userId;
  }

  Future<void> retrieveSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _sessionToken = prefs.getString('session_token');
  }

  Future<void> retrieveUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('userId');
  }

  Future<void> clearSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('session_token');
    _sessionToken = null;
  }

  Future<void> clearUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');
    _userId = null;
  }
}
