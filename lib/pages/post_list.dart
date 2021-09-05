import 'package:flutter/material.dart';
import 'package:post_app/post.dart';
import 'package:post_app/post_card.dart';

List<Post> posts = [];

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('All Posts'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: posts.map((post) => PostCard(
            post: post,
            delete: () {
              setState(() {
                posts.remove(post);
              });
            }
        )).toList(),
      ),
    );
  }
}