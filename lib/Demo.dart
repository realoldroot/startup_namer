import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldRoute();
    //Scaffold是Material中主要的布局组件.
    // return new Scaffold(
    //   appBar: new AppBar(
    //     leading: new IconButton(
    //       icon: new Icon(Icons.menu),
    //       tooltip: 'Navigation menu',
    //       onPressed: null,
    //     ),
    //     title: new Text('Example title'),
    //     actions: <Widget>[
    //       new IconButton(
    //         icon: new Icon(Icons.search),
    //         tooltip: 'Search',
    //         onPressed: null,
    //       ),
    //     ],
    //   ),
    //   //body占屏幕的大部分
    //   body: new Center(
    //     child: new Text('Hello, world!'),
    //   ),
    //   floatingActionButton: new FloatingActionButton(
    //     tooltip: 'Add', // used by assistive technologies
    //     child: new Icon(Icons.add),
    //     onPressed: null,
    //   ),
    // );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            stars,
            const Text(
              "170 Reviews",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  letterSpacing: 0.5,
                  fontSize: 20),
            )
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text('App Name'),

        actions: [
          //导航栏右侧菜单
          IconButton(onPressed: () {}, icon: Icon(Icons.share))
        ],
      ),
      drawer: MyDrawer(),
      //抽屉
      body: Center(
          child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Text("Strawberry Pavlova"),
                Text("xxxxxxxx xxxxxxxx xxxxxxx xxxxxxxxx"),
                ratings,
                Row(
                  children: [
                    Column(
                      children: [Icon(Icons.book_online), Text("dddd")],
                    ),
                    Column(
                      children: [Icon(Icons.book_online), Text("dddd")],
                    ),
                    Column(
                      children: [Icon(Icons.book_online), Text("dddd")],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: "business"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    print("index:$index");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                          child: Icon(
                        Icons.accessibility,
                        size: 80,
                      )),
                    ),
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
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
