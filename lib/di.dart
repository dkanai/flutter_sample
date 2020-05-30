import 'article/repository/article_repository.dart';

class DI {
  static ArticleRepository _articleRepository = ArticleRepository();

  static void setArticleRepository(ArticleRepository repository) {
    _articleRepository = repository;
  }

  static ArticleRepository articleRepository() {
    return _articleRepository;
  }
}
