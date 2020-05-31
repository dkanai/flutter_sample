import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';

class WebDriver {
  FlutterDriver driver;

  Future init() async {
    driver = await FlutterDriver.connect();
  }

  Future containText(String text) async {
    await driver.waitFor(find.text(text), timeout: const Duration(seconds: 5)).catchError((e) {
      throw StateError("Assertion Error: couldn't find text '$text' in screen.");
    });
  }

  Future notContainText(String text) async {
    sleep(const Duration(seconds: 5));
    try {
      await containText(text);
    } catch (e) {
      return;
    }
    throw StateError("Assertion Error: found text '$text' in screen.");
  }

  Future close() async {
    if (driver != null) {
      await driver.close();
    }
  }

  Future tapByType(String targetType) async {
    await driver.tap(find.byType(targetType), timeout: const Duration(seconds: 5));
  }

  Future tapByKey(String key) async {
    await driver.tap(find.byValueKey(key), timeout: const Duration(seconds: 5));
  }

  Future enterText(String id, String value) async {
    await tapByKey(id);
    await driver.enterText(value);
  }
}
