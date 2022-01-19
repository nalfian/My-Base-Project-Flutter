import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpValue {
  SharedPreferences prefs;

  removeSP({String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(key);
  }

  saveJson(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  readJson(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? "");
  }

  saveText({String key, String value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getText(String key) async {
    prefs = await SharedPreferences.getInstance();
    String prov = prefs.getString(key) ?? "";
    return prov;
  }

  saveBool({String key, bool value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    prefs = await SharedPreferences.getInstance();
    bool prov = prefs.getBool(key) ?? false;
    return prov;
  }

  saveInt({String key, int value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<int> getInt(String key) async {
    prefs = await SharedPreferences.getInstance();
    int prov = prefs.getInt(key) ?? false;
    return prov;
  }
}
