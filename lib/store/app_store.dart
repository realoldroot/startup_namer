import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:startup_namer/entity/board.entity.dart';

class AppStore with ChangeNotifier {
  AppStore();

  factory AppStore.initial() => AppStore();
}

class BoardStore with ChangeNotifier {
  late List<Board> _boardCategory;

  List<Board> get boardCategory => _boardCategory;

  int get boardLength => _boardCategory.length;

  BoardStore(String loadString) {
    print(loadString);
    List list = json.decode(loadString);
    this._boardCategory = list.map((e) => Board.fromJson(e)).toList();
  }

  void favorite() {
    print("-----> favorite");
  }
}

Future<String?> loadData() async {
  return await rootBundle.loadString("assets/data/category.json");
}
