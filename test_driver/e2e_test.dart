import 'package:test/test.dart';

import 'web_driver.dart';

void main() {
  WebDriver d = WebDriver();
  setUpAll(() async => await d.init());
  tearDownAll(() async => d.close());

  test('it should see articles', () async {
    await d.containText('kanai');
    await d.containText('daiki');
  });
}
