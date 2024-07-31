import 'package:flutter/material.dart';
import 'package:rest_app/helper/comment_helper.dart';
import 'package:rest_app/model/comment.dart';

class CommentScreen extends StatefulWidget {
  int postId;
  CommentScreen(this.postId);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final CommentHelper _helper = CommentHelper();
  late Future<List<Comment>> _comments;

  @override
  void initState() {
    super.initState();
    _comments = _helper.getAllComments(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Comments'),
        ),
        body: FutureBuilder(
            future: _comments,
            builder:
                (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
              if (snapshot.hasData) {
                List<Comment> comments = snapshot.data!;
                return ListView.separated(
                  itemCount: comments.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(comments[index].name),
                      subtitle: Text(comments[index].body),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
