import 'package:pd_carnet_native/article/model/article.dart';

class ArticleRepository {

  Future<List<Article>> all() async {
    // data get form json api or somewhere
    return [Article.reConstruct(1, 'kanai'), Article.reConstruct(2, 'daiki')];
  }
}
