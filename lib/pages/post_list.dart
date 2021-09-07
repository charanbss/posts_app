import 'package:flutter/material.dart';
import 'package:post_app/post.dart';
import 'package:post_app/post_card.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('All Posts'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [Column(
          children: [
            Column(
              children: posts.map((post) => PostCard(
                  post: post,
                  delete: () {
                    setState(() {
                      posts.remove(post);
                    });
                  },
                index: posts.indexOf(post),
                edit: () async {
                  dynamic result= await Navigator.pushNamed(context,'/edit',
                      arguments: {
                        'title':post.title,
                        'desc':post.description,
                        'url':post.url,
                      }
                  );
                  setState(() {
                    posts[posts.indexOf(post)]=
                        Post(title: result['title'], description: result['desc'],url: result['url'],);
                  });
                },
              )).toList(),
            ),
          ],
        ),
      ]),
    );
  }
}