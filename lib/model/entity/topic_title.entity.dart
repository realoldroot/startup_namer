import 'package:nga/model/entity/board.entity.dart';
import 'package:nga/model/entity/topic_title.dart';

class TopicListResponseEntity {
  late int code;
  late TopicListResult result;
  String? msg;

  TopicListResponseEntity.fromJson(dynamic json) {
    code = json["code"];
    result = TopicListResult.fromJson(json["result"]);
    msg = json["msg"];
  }
}

class TopicListResult {
  late int tRows;
  late int tRowsPage;
  late int rows;
  late int rRowsPage;

  late List<TopicTitle> t;
  late ResultF f;
  late ResultGlobal global;
  late ResultCu cu;

  TopicListResult.fromJson(dynamic json) {
    rows = json["__ROWS"];
    tRows = json["__T__ROWS"];
    tRowsPage = json["__T__ROWS_PAGE"];
    rRowsPage = json["__R__ROWS_PAGE"];
    cu = ResultCu.fromJson(json["__CU"]);
    f = ResultF.fromJson(json["__F"]);
    global = ResultGlobal.fromJson(json["__GLOBAL"]);
    t = [];
    var data = json["__T"];
    if (data != null) {
      var type = data.runtimeType.toString();
      if (type.contains("List")) {
        (data as List).forEach((e) {
          t.add(TopicTitle.fromJson(e));
        });
      } else {
        (data as Map).values.forEach((e) {
          t.add(TopicTitle.fromJson(e));
        });
      }
    }
  }
}

// __CU
class ResultCu {
  late int uid;
  late int groupBit;
  late int adminCheck;
  late int rvrc;

  ResultCu.fromJson(dynamic json) {
    uid = json["uid"];
    groupBit = json["group_bit"];
    adminCheck = json["admincheck"];
    rvrc = json["rvrc"];
  }
}

// __GLOBAL
class ResultGlobal {
  late String attachBaseView;

  ResultGlobal.fromJson(dynamic json) {
    attachBaseView = json["_ATTACH_BASE_VIEW"];
  }
}

// __F
class ResultF {
  late int fid;
  late String name;
  late int toppedTopic;
  late List<BoardItem> subForums;

  ResultF.fromJson(dynamic json) {
    fid = json["fid"];
    name = json["name"];
    toppedTopic = json["topped_topic"];
    subForums = [];

    var data = json["sub_forums"];
    if (data != null) {
      var type = data.runtimeType.toString();
      if (type.contains("List")) {
        (data as List).forEach((e) {
          subForums.add(BoardItem(fid: e[0], name: e[1]));
        });
      } else {
        (data as Map).values.forEach((e) {
          subForums.add(BoardItem(fid: e[0], name: e[1]));
        });
      }
    }
  }
}
