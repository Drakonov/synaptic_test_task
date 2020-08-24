import 'dart:convert';

ItemPost itemPostFromJson(String str) => ItemPost.fromJson(json.decode(str));

String itemPostToJson(ItemPost data) => json.encode(data.toJson());

class ItemPost {
  ItemPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ItemPost.fromJson(Map<String, dynamic> json) => ItemPost(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
