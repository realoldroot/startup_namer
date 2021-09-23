import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sprintf/sprintf.dart';

import '../page/topic_title.dart';
import '../model/entity/board.entity.dart';
import '../store/app_store.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  static const base_url =
      "http://img4.nga.178.com/ngabbs/nga_classic/f/app/%s.png";
  late TabController tabController;
  late BoardStore _boardStore;
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<BoardStore>(builder: (_, store, __) {
      _boardStore = store;
      return Scaffold(
          backgroundColor: Color.fromARGB(0xff, 0xff, 0xf8, 0xe7),
          appBar: AppBar(
            title: Text("首页"),
            bottom: _buildTabBar(),
          ),
          drawer: _buildDrawer(),
          body: _buildTabBody());
    });
  }

  // TabController.length有多少，TabBar的child就要有几个
  _buildTabBar() {
    tabController = TabController(
        initialIndex: 0, length: _boardStore.boardLength, vsync: this);
    tabController.addListener(() {
      currentTabIndex = tabController.index;
    });

    return TabBar(
        isScrollable: true,
        controller: tabController,
        tabs: _boardStore.boardCategoryList
            .map((e) => _buildTabBarItem(e.name))
            .toList());
  }

  Container _buildTabBarItem(text) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Text(
        text,
      ),
    );
  }

  // 每一个TabBarItem对应一个TabBarView
  _buildTabBody() {
    return TabBarView(
      children: _boardStore.boardCategoryList
          .map((e) => _buildTabBarView(e))
          .toList(),
      controller: tabController,
    );
  }

  Widget _buildTabBarView(BoardCategory board) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.25),
        itemCount: board.content.length,
        itemBuilder: (context, i) {
          return _buildBoardItem(board.content[i]);
        });
  }

  Widget _buildBoardItem(BoardItem ct) {
    return InkWell(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: _getBoardIcon(ct),
              ),
              Container(padding: EdgeInsets.only(top: 4), child: Text(ct.name)),
            ],
          )),
      onTap: () => _openTopicListPage(ct),
    );
  }

  _openTopicListPage(BoardItem item) {
    Navigator.push(
        context, MaterialPageRoute(builder: (build) => TopicTitlePage(item)));
  }

  _getBoardIcon(item) {
    return CachedNetworkImage(
      width: 48,
      height: 48,
      imageUrl: sprintf(base_url, [item.fid.toString()]),
      placeholder: (_, __) => CircularProgressIndicator(), //显示一个圆圈进度
    );
  }

  _buildDrawer() {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                color: Theme.of(context).primaryColor,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ClipOval(
                        child: Icon(
                      Icons.accessibility,
                      size: 80,
                    )),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16),
                    //   child: ClipOval(
                    //       child: Icon(
                    //     Icons.accessibility,
                    //     size: 80,
                    //   )),
                    // ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_add_rounded),
                    title: const Text("登陆账号"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_box),
                    title: const Text("添加面板"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_box),
                    title: const Text("添加面板ID"),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
