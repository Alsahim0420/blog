import 'dart:convert';

import 'package:pablos_blog/models/opinion_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Contains the preferences of the application
class Preferences {
  static final Preferences _instance = Preferences._privateConstructor();
  factory Preferences() => _instance;
  Preferences._privateConstructor();
  static late final SharedPreferences _preferences;
  static late final SharedPreferences prefs;
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    prefs = await SharedPreferences.getInstance();
  }

  static configurePrefs() async* {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _opinionKey = 'opinions';

  static List<OpinionModel> get opinion {
    final data =
        (json.decode(_preferences.getString(_opinionKey) ?? '[]')) as List;
    return data.map((e) => OpinionModel.fromJson(e)).toList();
  }
}
