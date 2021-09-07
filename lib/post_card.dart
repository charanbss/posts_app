import 'package:flutter/material.dart';
import 'post.dart';

class PostCard extends StatelessWidget {

  final Post post;
  final Function delete;
  final Function edit;
  final num index;
  PostCard({ required this.post , required this.delete, required this.index, required this.edit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              post.title,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              post.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8.0,),
            Image.network(post.url, height: 250,),
            SizedBox(height: 8.0,),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {edit();},
                    icon: Icon(Icons.edit),
                    label:Text(
                      'Edit',
                    )
                ),
                SizedBox(width: 10.0),
                TextButton.icon(
                    onPressed: (){delete();},
                    icon: Icon(Icons.delete),
                    label:Text('Delete')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}