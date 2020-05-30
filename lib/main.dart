import 'package:flutter/material.dart';

import 'article/screen/articles_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: Text('Articles')), body: ArticlesScreen()));
  }
}
