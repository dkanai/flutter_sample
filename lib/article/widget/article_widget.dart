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
              title: Row(
            children: <Widget>[
              Text(article.id.toString()),
              Text(article.name),
            ],
          )),
        ],
      ),
    ));
  }
}
