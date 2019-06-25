import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'post.dart';

class PostsList extends StatelessWidget {
  PostsList() : super();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RadPost>>(
        future: RadPost.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemBuilder: (BuildContext _context, int i) {
                if (snapshot.data != null) {
                  if (i < snapshot.data.length) {
                    return buildPostCard(snapshot.data[i]);
                  }
                } else {
                  print("error occurred");
                }
              },
            );
          } else if (snapshot.hasError) {
            print("snapshot has an error");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

/*
  buildPostCard
  | Use to create a card widget that displays data from a post
  | shows the name and associated tags.
  parameters
  | post: a RadPost object to display a card for
  returns
  | Widget: a card widget to be used in a view
 */
Widget buildPostCard(RadPost post) {
  return Card(
    child: Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        //crossAxisAlignment handles horizontal alignment
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(post.image),
                  ),
                ),
                Text(
                  post.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Flexible(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border),
                    onPressed: () {
                      post.savePost().then((bool success) {
                        print(success);
                      });
                    },
                  ),
                ))
              ],
            ),
          ),
          FadeInImage.memoryNetwork(
            image: post.post,
            placeholder: kTransparentImage,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: _buildCardTags(post.tags),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCardTags(List<String> tags) {
  List<Widget> chips = [];
  for (String tag in tags) {
    chips.add(Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          tag,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    ));
  }
  return Container(
    height: 44,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    ),
  );
}
