import 'dart:convert';

Posts postsFromMap(String str) => Posts.fromMap(json.decode(str));

String postsToMap(Posts data) => json.encode(data.toMap());

class Posts {
    Posts({
        required this.posts,
        required this.total,
        required this.skip,
        required this.limit,
    });

    List<Post> posts;
    int total;
    int skip;
    int limit;

    factory Posts.fromMap(Map<String, dynamic> json) => Posts(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toMap() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Post {
    Post({
        required this.id,
        required this.title,
        required this.body,
        required this.userId,
        required this.tags,
        required this.reactions,
    });

    int id;
    String title;
    String body;
    int userId;
    List<String> tags;
    int reactions;

    factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        reactions: json["reactions"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reactions": reactions,
    };
}
