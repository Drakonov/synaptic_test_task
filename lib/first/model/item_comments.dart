import 'dart:convert';

ItemComments itemCommentsFromJson(String str) => ItemComments.fromJson(json.decode(str));

String itemCommentsToJson(ItemComments data) => json.encode(data.toJson());

class ItemComments {
  ItemComments({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory ItemComments.fromJson(Map<String, dynamic> json) => ItemComments(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
