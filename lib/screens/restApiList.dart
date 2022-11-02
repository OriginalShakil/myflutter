// ignore_for_file: await_only_futures

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';
import '../models/testpost.dart';

class RestApiList extends StatefulWidget {
  const RestApiList({super.key});

  @override
  State<RestApiList> createState() => _RestApiListState();
}

class _RestApiListState extends State<RestApiList> {
  var pageurl = 'https://dummyjson.com/posts/';
  var isLoaded = false;
  late Posts posts;
  int itemCount = 0;

  // List<Post> postList = [];
  Map<String, dynamic> body = {};

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api App'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: InkWell(
                onTap: () async {
                  var urlDelete = pageurl + (index + 1).toString();
                  log('fdft $urlDelete');
                  var res = await http.delete(
                    Uri.parse(urlDelete),
                  );

                  Fluttertoast.showToast(
                      msg: "No: ${index + 1} has been Removed",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  log('No: ${index + 1} tgweuyewt ${res.body}');
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              // title: Text(postList[index].title),
              // subtitle: Text(postList[index].body),
              // leading: Text(postList[index].id.toString()),

              title: Text(posts.posts[index].title),
              subtitle: Text(posts.posts[index].body),
              leading: Text(posts.posts[index].id.toString()),
            );
          },
        ),
      ),
    );
  }

  void loadData() async {
    var res = await http.get(Uri.parse(pageurl));
    try {
      body = jsonDecode(res.body);
      var test = body;

      posts = Posts.fromMap(test);

      // final postMeta = body['posts'] as List;

      // postList =
      //     List<Post>.from(postMeta.map((postData) => Post.fromMap(postData)));

      // log('wcr4r43 $postList');
      setState(() {
        itemCount = posts.posts.length;
        isLoaded = true;
      });
    } catch (e) {
      log('testing error: $e');
    }
    log('status code : ${res.statusCode}');
  }
}
