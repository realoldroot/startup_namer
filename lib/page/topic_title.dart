import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/entity/board.entity.dart';
import '../store/app_store.dart';

class TopicTitle extends StatelessWidget {
  final BoardItem boardItem;

  TopicTitle(this.boardItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(boardItem.name),
        actions: _buildActionMenu(),
      ),
    );
  }

  List<Widget> _buildActionMenu() {
    return <Widget>[
      _favoriteBtn(),
      IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
      _buildPopupMenu(),
    ];
  }

  _favoriteBtn() {
    return Consumer<BoardStore>(builder: (_, store, __) {
      return IconButton(
          onPressed: () => store.favorite(boardItem),
          icon: Icon(store.isFavorite(boardItem)
              ? Icons.favorite
              : Icons.favorite_border));
    });
  }

  _buildPopupMenu() {
    return PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              PopupMenuItem(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: Text("24小时热帖"),
              )),
              PopupMenuItem(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: Text("浏览历史"),
              )),
            ]);
  }
}
