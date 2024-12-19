import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  String languagecode='en';

 void onChangeLanguage(String selectedlanguage){
  if (selectedlanguage==languagecode)return;
     languagecode=selectedlanguage;
     notifyListeners();
  }
}