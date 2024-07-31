import 'dart:convert';

import 'package:rest_app/model/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>> fetchPosts({String? userId}) async {
    final url = userId != null
        ? await 'https://jsonplaceholder.typicode.com/posts?userId=$userId'
        : await 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));

    print(url);
    List<Post> posts = List<Post>.empty(growable: true);
    if (response.statusCode == 200) {
      List resList = json.decode(response.body);
      resList.forEach((element) {
        posts.add(Post.fromJson(element));
      });
      print(posts);
      return posts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
