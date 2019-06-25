import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RadPost {
  final String title;
  final String url;
  final String image;
  final String post;
  final List<String> tags;

  RadPost(this.title, this.url, this.tags,this.image,this.post);

  RadPost.fromJSON(Map<String, dynamic> json)
      : title = json['name'] ?? '',
        url = json['url'] ?? '',
        image = json['image'] ?? '',
        post = json['post'] ?? '',
        tags = json['tags'].cast<String>() ?? [];

  Map<String, dynamic> toJSON() => {'name': title, 'url': url, 'image':image, 'post':post ,'tags': tags};

  static Future<List<RadPost>> fetchPosts() async {
    try {
      //dogs url: https://escherwd.com/dogs.json
      final response = await http.get('https://escherwd.com/dogs.json');
      //everything here is after the request is downloaded
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        List<dynamic> dogsDynamic = jsonMap['dogs'];
        List<RadPost> dogs = [];
        for (var dog in dogsDynamic) {
          dogs.add(RadPost.fromJSON(dog));
        }
        return dogs;
      } else {
        return null;
      }
    } catch (e) {
      print("error occured");
      print(e);
      return null;
    }
  }

  Future<bool> savePost() async {
    try {
      var response = await http.post("https://puppies.serveo.net/save?name="+this.title.toLowerCase().replaceAll(" ", "_"));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
