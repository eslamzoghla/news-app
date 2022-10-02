import 'package:shared_preferences/shared_preferences.dart';

class cashesHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBoolean(
      {required String key, required bool value}) async {
    // print(sharedPreferences?.setBool(key,value));
    return await sharedPreferences?.setBool(key, value);
  }

  static bool? getBoolean({required String key}) {
    // print(sharedPreferences?.getBool(key));
    return sharedPreferences?.getBool(key);
  }
}
