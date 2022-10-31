import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class RestApiList extends StatefulWidget {
  const RestApiList({super.key});

  @override
  State<RestApiList> createState() => _RestApiListState();
}

class _RestApiListState extends State<RestApiList> {
  var pageurl = 'https://dummyjson.com/posts';
  var isLoaded = false;
  List<Post> postList = [];
  Map<String, dynamic> body = {};

  @override
  void initState() {
    // TODO: implement initState
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
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return ListTile(
              trailing: InkWell(
                onTap: () {
                  
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(postList[index].title),
              subtitle: Text(postList[index].body),
              leading: Text(postList[index].id.toString()),
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
      final postMeta = body['posts'] as List;

      postList =
          List<Post>.from(postMeta.map((postData) => Post.fromMap(postData)));

      log('wcr4r43 $postList');
      setState(() {
        isLoaded = true;
      });
    } catch (e) {
      log('testing error: $e');
    }
    log('status code : ${res.statusCode}');
  }
}
