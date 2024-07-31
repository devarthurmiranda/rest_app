import 'package:rest_app/model/comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentService {
  Future<List<Comment>> getComments(int postId) async {
    final String url =
        await 'https://jsonplaceholder.typicode.com/comments?postId=$postId';
    final response = await http.get(Uri.parse(url));
    List<Comment> comments = List<Comment>.empty(growable: true);
    if (response.statusCode == 200) {
      List resList = json.decode(response.body);

      resList.forEach((pComment) {
        comments.add(Comment.fromJson(pComment));
      });
    }
    return comments;
  }
}
