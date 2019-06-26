import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'post.dart';

class PostsList extends StatefulWidget {
  PostsList() : super();

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
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
                    var post = snapshot.data[i];
                    return PostCard(post);
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


class PostCard extends StatefulWidget {

  RadPost post;

  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(widget.post.image),
                  ),
                ),
                Text(
                  widget.post.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Flexible(
                    child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon((widget.post.saved) ? Icons.bookmark : Icons.bookmark_border),
                    onPressed: () {
                      widget.post.savePost().then((bool success) {
                        print(success);
                         setState(() {
                           widget.post.saved = success;
                         });
                       }); 
                    },
                  ),
                ))
              ],
            ),
          ),
          FadeInImage.memoryNetwork(
            image: widget.post.post,
            placeholder: kTransparentImage,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: _buildCardTags(widget.post.tags),
          ),
        ],
      ),
    ),
  );
  }
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
