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
      builder: (context, articles) {
        if (articles.hasData == false) return CircularProgressIndicator();
        return listView(articles);
      },
    );
  }

  Widget listView(AsyncSnapshot<List<Article>> articles) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: articles.data.length,
        itemBuilder: (context, index) {
          return ArticleWidget(articles.data[index]);
        });
  }
}
