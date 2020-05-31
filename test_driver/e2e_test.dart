import 'package:test/test.dart';

import 'driver.dart';

void main() {
  Driver d = Driver();
  setUpAll(() async => await d.init());
  tearDownAll(() async => d.close());

  test('it should see articles', () async {
    await d.containText('kanai');
    await d.containText('daiki');
  });
}
