import 'package:pd_carnet_native/article/model/article.dart';

class DataFactory {
  DataFactory() {
    article = ArticleFactory();
  }

  ArticleFactory article;
}

class ArticleFactory {
  int id = 0;

  Article create({String name}) {
    return Article.reConstruct(++id, name);
  }
}
