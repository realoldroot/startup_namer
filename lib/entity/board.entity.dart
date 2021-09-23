class Board {
  Board({
    String? name,
    List<Content>? content,
  }) {
    _name = name;
    _content = content;
  }

  Board.fromJson(dynamic json) {
    _name = json['name'];
    if (json['content'] != null) {
      _content = [];
      json['content'].forEach((v) {
        _content?.add(Content.fromJson(v));
      });
    }
  }

  String? _name;
  List<Content>? _content;

  String? get name => _name;

  List<Content>? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    if (_content != null) {
      map['content'] = _content?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// fid : 7
/// name : "艾泽拉斯议事厅"
/// info : "魔兽主讨论区"
/// nameS : "议事厅"

class Content {
  Content({
    int? fid,
    String? name,
    String? info,
    String? nameS,
  }) {
    _fid = fid;
    _name = name;
    _info = info;
    _nameS = nameS;
  }

  Content.fromJson(dynamic json) {
    _fid = json['fid'];
    _name = json['name'];
    _info = json['info'];
    _nameS = json['nameS'];
  }

  int? _fid;
  String? _name;
  String? _info;
  String? _nameS;

  int? get fid => _fid;

  String? get name => _name;

  String? get info => _info;

  String? get nameS => _nameS;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fid'] = _fid;
    map['name'] = _name;
    map['info'] = _info;
    map['nameS'] = _nameS;
    return map;
  }
}
