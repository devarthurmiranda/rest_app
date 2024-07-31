import 'package:flutter/material.dart';
import 'package:rest_app/helper/login_helper.dart';
import 'package:rest_app/model/post.dart';
import 'package:rest_app/helper/post_helper.dart';
import 'package:rest_app/view/comment_screen.dart';
import 'package:rest_app/view/login_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostHelper _helper = PostHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Your Posts'), centerTitle: true, actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              final loginHelper = LoginHelper();
              await loginHelper.logout();
              if (await loginHelper.isUserLoggedIn() == false) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            })
      ]),
      body: FutureBuilder(
          future: _helper.getPostsByUser(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List posts = snapshot.data!;
              return ListView.separated(
                  itemCount: posts.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CommentScreen(posts[index].id)));
                      },
                      child: ListTile(
                        title: Text(posts[index].title),
                        subtitle: Text(posts[index].body),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
