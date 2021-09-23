import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nga/model/entity/topic_title.dart';
import 'package:nga/model/entity/topic_title.entity.dart';
import 'package:provider/provider.dart';
import '../model/entity/board.entity.dart';
import '../store/app_store.dart';

class TopicTitlePage extends StatelessWidget {
  final BoardItem boardItem;

  final ScrollController scrollController = new ScrollController();

  TopicTitlePage(this.boardItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(boardItem.name),
        actions: _buildActionMenu(),
      ),
      body: _TopicTitleContainer(boardItem, scrollController),
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

class _TopicTitleContainer extends StatelessWidget {
  _TopicTitleContainer(BoardItem boardItem, ScrollController scrollController);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TopicTitle>>(
        future: _loadData(),
        builder: (context, snapshot) => _loadDataList(context, snapshot));
  }

  _loadDataList(
      BuildContext context, AsyncSnapshot<List<TopicTitle>> snapshot) {
    if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    }
    if (snapshot.data != null) {
      var data = snapshot.data;
      return ListView.builder(
          itemCount: data?.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(data?[index].subject ?? ""),
              ));
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
      case ConnectionState.done:
        return Container(
          child: CircularProgressIndicator(),
          alignment: Alignment.center,
        );
      case ConnectionState.active:
        return Text("${snapshot.data}");
    }
  }

  Future<List<TopicTitle>> _loadData() async {
    var value = await rootBundle.loadString("assets/data/topicTitle.json");
    var decode = json.decode(value);
    var resp = TopicListResponseEntity.fromJson(decode);
    return resp.result.t;
  }
}
