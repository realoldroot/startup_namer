import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/home.dart';
import 'package:startup_namer/store/app_store.dart';

void main() {
  AppStore store = AppStore.initial();

  BoardStore boardStore = BoardStore.initial();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: store),
      ChangeNotifierProvider.value(value: boardStore),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "this ?",
      home: Home(),
    );
  }
}
