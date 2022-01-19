import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreferences prefs;

  saveVersionApp(String version) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('version', version);
  }

  Future<String> getVersion() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('version') ?? '';
  }
}
