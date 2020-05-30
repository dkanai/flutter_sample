import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pd_carnet_native/article/model/article.dart';

import '../../di.dart';
import '../widget/article_widget.dart';

class ArticlesScreen extends StatefulWidget {
  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: DI.articleRepository().all(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return CircularProgressIndicator();
        }
        return Column(children: buildFavoriteGroup(snapshot));
      },
    );
  }

  List<Widget> buildFavoriteGroup(AsyncSnapshot<List<Article>> snapshot) {
    return [
      ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return ArticleWidget(snapshot.data[index]);
          })
    ];
  }
}
