import 'package:rest_app/model/comment.dart';
import 'package:rest_app/service/comment_service.dart';

class CommentHelper {
  final CommentService _service = CommentService();
  Future<List<Comment>> getAllComments(int postId) {
    return _service.getComments(postId);
  }
}
