import 'package:shared_preferences/shared_preferences.dart';

class cashesHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBoolean(
      {required String key, required bool value}) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static Future<bool?> saveData({required String key, required dynamic value}) {
    if (value is String) {
      return sharedPreferences!.setString(key, value);
    } else if (value is bool) {
      return sharedPreferences!.setBool(key, value);
    } else if (value is int) {
      return sharedPreferences!.setInt(key, value);
    }
    return sharedPreferences!.setDouble(key, value);
  }

  static Future<bool?> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
