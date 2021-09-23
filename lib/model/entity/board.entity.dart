class BoardCategory {
  late String _name;
  late List<BoardItem> _content;

  BoardCategory({
    required String name,
    required List<BoardItem> content,
  }) {
    _name = name;
    _content = content;
  }

  BoardCategory.fromJson(dynamic json) {
    _name = json['name'];
    _content = [];
    if (json['content'] != null) {
      json['content'].forEach((v) {
        _content.add(BoardItem.fromJson(v));
      });
    }
  }

  String? get name => _name;

  List<BoardItem> get content => _content;
}

/// fid : 7
/// name : "艾泽拉斯议事厅"
/// info : "魔兽主讨论区"
/// nameS : "议事厅"

class BoardItem {
  late int _fid;
  late String _name;
  String? _info;
  String? _nameS;

  BoardItem({
    required int fid,
    required String name,
    String? info,
    String? nameS,
  }) {
    _fid = fid;
    _name = name;
    _info = info;
    _nameS = nameS;
  }

  BoardItem.fromJson(dynamic json) {
    _fid = json['fid'];
    _name = json['name'];
    _info = json['info'];
    _nameS = json['nameS'];
  }

  int get fid => _fid;

  String get name => _name;

  String? get info => _info;

  String? get nameS => _nameS;
}
