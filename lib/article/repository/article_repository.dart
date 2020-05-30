import 'package:pd_carnet_native/article/model/article.dart';

class ArticleRepository {
  static List<Article> schoolFavoriteGroups;
  static int uid = 0;

  static List<Article> initSchoolFavoriteGroup() {
    var data = [
      [1, 'daiki'],
      [2, 'kana'],
    ];
    final records = data.map((item) {
      final Article s = Article.reConstruct(item[0], item[1]);
      s.id = ++uid;
      return s;
    }).toList();
    records.sort((a, b) => a.id.compareTo(b.id));
    return records;
  }

  Future<List<Article>> all() async {
    return [Article.reConstruct(1, 'kanai'), Article.reConstruct(1, 'daiki')];
  }
}
