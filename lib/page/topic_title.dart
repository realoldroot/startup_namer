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

  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);

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
      return ListView.separated(
          separatorBuilder: (context, index) =>
              index % 2 == 0 ? divider1 : divider2,
          itemCount: data?.length ?? 10,
          itemBuilder: (BuildContext context, int index) =>
              _buildTopicListItem(context, data![index]));
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

  Widget _buildTopicListItem(BuildContext context, TopicTitle topicTitle) {
    return InkWell(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(topicTitle.subject ?? ""),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.person),
                Text(topicTitle.author ?? ""),
                Spacer(),
                Icon(Icons.reply, textDirection: TextDirection.rtl),
                Text(topicTitle.lastposter ?? ""),
                Text(topicTitle.replies.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
