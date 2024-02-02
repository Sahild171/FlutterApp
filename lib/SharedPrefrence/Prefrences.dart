import 'package:shared_preferences/shared_preferences.dart';


class Prefrences{

  final String userid="USER_ID";

  Future<void> setUserId(String user_id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userid, user_id);
  }

//get value from shared preferences
  Future<String> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String user_id;
    user_id = (pref.getString(userid) ?? null)!;
    return user_id;
  }
}