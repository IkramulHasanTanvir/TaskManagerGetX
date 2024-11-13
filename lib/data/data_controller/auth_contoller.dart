import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _tokenKey = 'token-key';

  static String? accessToken;

  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    accessToken = token;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    accessToken = token;
    return token;
  }

  bool isLoggedIn() {
    return accessToken != null;
  }

  Future<void> clearAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_tokenKey);
    accessToken = null;
  }
}
