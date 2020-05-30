import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pd_carnet_native/article/model/article.dart';

class ArticleWidget extends StatelessWidget {
  ArticleWidget(this.article, {Key key}) : super(key: key);
  Article article;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      child: Column(
        children: <Widget>[
          ListTile(
              key: Key('article-${article.id}'),
              onTap: () {
//                Navigator.of(context).push(Navigation(SchoolFavoriteScreen.screenTitle + ' (' + item.name + ')').next(SchoolFavoriteScreen(item.id)));
              },
              leading: const Icon(Icons.book),
              title: Row(
                children: <Widget>[
                  Text(article.name),
                ],
              )),
        ],
      ),
    ));
  }
}
