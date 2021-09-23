import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page/home.dart';
import '../store/app_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppStore store = AppStore.initial();
  BoardStore? boardStore;
  loadData().then((value) => {
        boardStore = BoardStore(value),
        runApp(MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: store),
            ChangeNotifierProvider.value(value: boardStore),
          ],
          child: MyApp(),
        ))
      });
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
