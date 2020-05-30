import 'package:flutter_test/flutter_test.dart';
import 'package:pd_carnet_native/article/screen/articles_screen.dart';
import 'package:pd_carnet_native/di.dart';

import '../data_factory.dart';
import '../mock.dart';
import '../test_helper.dart';

void main() {
  DataFactory data;
  setUp(() => data = DataFactory());

  testWidgets('it should see articles', (WidgetTester tester) async {
    //given
    final FakeArticleRepository fake = FakeArticleRepository();
    fake.setArticles([
      data.article.create(name: 'kanai'),
      data.article.create(name: 'daiki'),
    ]);
    DI.setArticleRepository(fake);
    //when
    await tester.pumpWidget(WidgetFactory().create(ArticlesScreen()));
    await tester.pumpAndSettle();
    //then
    expect(find.text('kanai'), findsOneWidget);
    expect(find.text('daiki'), findsOneWidget);
  });
}
