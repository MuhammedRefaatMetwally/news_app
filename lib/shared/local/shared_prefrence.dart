
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool?> saveData(String key, bool value) async {
    try {
      return await _sharedPreferences?.setBool(key, value);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  getData(String key) async {
    try {
      final data = _sharedPreferences?.get(key);
      if (kDebugMode) {
        print(data);
      }
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
