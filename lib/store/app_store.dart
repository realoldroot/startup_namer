import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../model/entity/board.entity.dart';

class AppStore with ChangeNotifier {
  AppStore();

  factory AppStore.initial() => AppStore();
}

class BoardStore with ChangeNotifier {
  late List<BoardCategory> _boardCategoryList;

  List<BoardCategory> get boardCategoryList => _boardCategoryList;

  int get boardLength => _boardCategoryList.length;

  late BoardCategory _collection;

  BoardCategory get collection => _collection;

  BoardStore(String loadString) {
    List list = json.decode(loadString);
    this._boardCategoryList =
        list.map((e) => BoardCategory.fromJson(e)).toList();
    this._collection = BoardCategory(name: "我的收藏", content: []);
  }

  void favorite(BoardItem boardItem) {
    if (_collection.content.contains(boardItem)) {
      _collection.content.remove(boardItem);
    } else {
      _collection.content.add(boardItem);
    }
    notifyListeners();
  }

  bool isFavorite(BoardItem boardItem) {
    return _collection.content.contains(boardItem);
  }
}

Future<String> loadData() async {
  return await rootBundle.loadString("assets/data/category.json");
}
