import 'package:flutter/cupertino.dart';

class CricketModel {
  String? Cricformat;
  String? Playername;
  String? age;

  CricketModel({this.Cricformat, this.Playername, this.age});

  factory CricketModel.myjson(Map<String, dynamic> parsed) {
    return CricketModel(
      Cricformat: parsed['format'],
      Playername: parsed['playername'],
      age: parsed['age']
    );
  }
}
