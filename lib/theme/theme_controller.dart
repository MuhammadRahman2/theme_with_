import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_prac/theme/theme.dart';

class ThemeController extends GetxController {
  final Rx<ThemeData> _themeData = ThemeData.light().obs;

  ThemeData get themeData => _themeData.value;

  void toggleTheme() {
    _themeData.value = _themeData.value == Themes.lightTheme ? Themes.darkTheme : Themes.lightTheme;
    saveThemeToPreferences();
  }

  void saveThemeToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeData.value == Themes.darkTheme);
  }


  void loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData.value = isDarkMode ? Themes.darkTheme : Themes.lightTheme;
  }


@override
void onInit() {
  super.onInit();
  loadThemeFromPreferences();
}

}

  // void toggleTheme(){
  //   if (_themeData == Themes.lightTheme){
  //     themeData = Themes.darkTheme;
  //   }else{
  //     themeData = Themes.lightTheme;
  //   }
  // }


// class ThemeController extends ChangeNotifier{
//   ThemeData _themeData = Themes.lightTheme;
//
//   ThemeData get themeData => _themeData;
//
//   set themeData(ThemeData themeData){
//     _themeData = themeData;
//     notifyListeners();
//   }
//
//   void toggleTheme(){
//     if (_themeData == Themes.lightTheme){
//       themeData = Themes.darkTheme;
//     }else{
//       themeData = Themes.lightTheme;
//     }
//   }
// }