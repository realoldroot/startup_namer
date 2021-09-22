import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class AppStore with ChangeNotifier {
  BoardStore _boardStore;

  BoardStore get getBoardStore => _boardStore;

  AppStore(this._boardStore);

  factory AppStore.initial() => AppStore(BoardStore.initial());
}

class BoardStore with ChangeNotifier {
  List<BoardCategory> _boardCategory;

  List<BoardCategory> get boardCategory => _boardCategory;

  int get boardLength => _boardCategory.length;

  BoardStore(this._boardCategory);

  factory BoardStore.initial() {
    return BoardStore([
      BoardCategory(
        "综合讨论",
        [
          BoardItem(7, "艾泽拉斯议事厅", "魔兽主讨论区"),
          BoardItem(310, "精英议会", "新版本与高阶讨论"),
          BoardItem(323, "国服以外", null),
          BoardItem(10, "银色黎明", "投诉/网站BUG/建议"),
          BoardItem(230, "艾泽拉斯风纪委员会", "曝光违背公认准则的行为"),
        ],
      ),
      BoardCategory(
        "大漩涡系列",
        [
          BoardItem(-7, "网事杂谈", null),
          BoardItem(436, "消费电子 IT新闻", null),
          BoardItem(-343809, "寂寞的车", "车迷俱乐部"),
          BoardItem(-576177, "影音讨论区", null),
        ],
      )
    ]);
  }
}

class BoardCategory {
  String name;
  List<BoardItem> boardItemList;

  BoardCategory(this.name, this.boardItemList);
}

class BoardItem {
  int fid;
  String name;
  String? info;

  BoardItem(this.fid, this.name, this.info);
}
