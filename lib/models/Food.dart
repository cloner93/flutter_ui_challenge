import 'package:flutter/foundation.dart';

class Food {
  int id;
  String title;
  String category;
  double star;
  int commentNo;
  String imageUrl;
  int timeToDone;
  Food({
    @required this.title,
    @required this.category,
    @required this.star,
    @required this.commentNo,
    @required this.imageUrl,
    @required this.timeToDone,
  });
}
