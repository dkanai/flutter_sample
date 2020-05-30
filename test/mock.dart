import 'dart:async';

import 'package:pd_carnet_native/article/model/article.dart';
import 'package:pd_carnet_native/article/repository/article_repository.dart';

class FakeArticleRepository implements ArticleRepository {
  @override
  List<Article> items;
  List<Article> searchItems;

  FakeArticleRepository([this.items]);

  void setArticles(List<Article> items) {
    this.items = items;
  }

  @override
  Future<List<Article>> all() {
    var completer = Completer<List<Article>>();
    completer.complete(items);
    return completer.future;
  }
}
