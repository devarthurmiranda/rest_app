import 'package:rest_app/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<User?> getUserByUsername(String username) async {
    final url =
        await 'https://jsonplaceholder.typicode.com/users?username=$username';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List resList = json.decode(response.body);
      if (resList.isNotEmpty) {
        User resUser = User.fromJson(resList.first);
        return resUser;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
