import 'package:rest_app/model/user.dart';
import 'package:rest_app/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginHelper {
  Future<User?> login(String username, String password) async {
    UserService _service = UserService();
    User? user = await _service.getUserByUsername(username);
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("logged", true);
      prefs.setString("userId", user.id.toString());
      prefs.setString("username", user.username);
      return user;
    } else {
      await logout();
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged") == null ? false : prefs.getBool("logged")!;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("logged", false);
    prefs.remove("userId");
    prefs.remove("username");
  }
}
