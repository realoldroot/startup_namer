import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0xff, 0xff, 0xf8, 0xe7),
      appBar: AppBar(
        title: Text("首页"),
        bottom: _buildTabBar(),
      ),
      drawer: _buildDrawer(),
      body: _buildTabBody(),
    );
  }

  // TabController.length有多少，TabBar的child就要有几个
  _buildTabBar() {
    tabController = TabController(initialIndex: 1, length: 7, vsync: this);
    tabController.addListener(() {
      currentTabIndex = tabController.index;
    });

    return TabBar(isScrollable: true, controller: tabController, tabs: [
      _buildTabBarItem("text1"),
      _buildTabBarItem("text2"),
      _buildTabBarItem("text3"),
      _buildTabBarItem("text4"),
      _buildTabBarItem("text5"),
      _buildTabBarItem("text6"),
      _buildTabBarItem("text7"),
    ]);
  }

  _buildTabBarItem(text) {
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
      children: [
        _buildTabBarItem("text1"),
        _buildTabBarItem("text2"),
        _buildTabBarItem("text3"),
        _buildTabBarItem("text4"),
        _buildTabBarItem("text5"),
        _buildTabBarItem("text6"),
        _buildTabBarItem("text7"),
      ],
      controller: tabController,
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
