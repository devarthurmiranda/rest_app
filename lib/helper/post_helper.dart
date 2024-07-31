import 'package:rest_app/model/post.dart';
import 'package:rest_app/service/post_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostHelper {
  Future<List<Post>> getPostsByUser() async {
    PostService _service = PostService();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("logged") != null) {
      return _service.fetchPosts(userId: prefs.getString("userId"));
    }
    return List<Post>.empty(growable: true);
  }
}
