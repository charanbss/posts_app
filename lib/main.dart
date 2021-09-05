import 'package:flutter/material.dart';
import 'package:post_app/pages/home.dart';
import 'package:post_app/pages/post_list.dart';
import 'package:post_app/pages/form.dart';
import 'package:post_app/post.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    //'/': (context) => Loading(),
    '/home': (context) => Home(),
    '/form': (context) => MakePost(),
    '/posts': (context) => PostList(),
  },
));

