import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'post.dart';

class PostsList extends StatelessWidget {
  PostsList() : super();

  final posts = getPosts();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i < posts.length) {
          return buildPostCard(posts[i]);
        }
      },
    );
  }
}

Widget buildPostCard(RadPost post) {
  return Card(
    child: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Container(child: Text(post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                width: double.infinity,
                ),
          
        ],
      ),
    ),
  );
}
