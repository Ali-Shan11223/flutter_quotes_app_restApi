import 'package:flutter/material.dart';

class Quotes with ChangeNotifier{
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["quote"] is String) {
      quote = json["quote"];
    }
    if (json["author"] is String) {
      author = json["author"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["quote"] = quote;
    data["author"] = author;
    return data;
  }

}
