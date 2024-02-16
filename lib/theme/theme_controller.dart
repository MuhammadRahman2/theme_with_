import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_prac/theme/theme.dart';

class ThemeController extends GetxController{
  Rx<ThemeData> _themeData = Themes.lightTheme.obs;

  ThemeData get themeData => _themeData.value;

  void toggleTheme() {
    _themeData.value = _themeData.value == Themes.lightTheme ? Themes.darkTheme : Themes.lightTheme;
    // update();
  }

  // void toggleTheme(){
  //   if (_themeData == Themes.lightTheme){
  //     themeData = Themes.darkTheme;
  //   }else{
  //     themeData = Themes.lightTheme;
  //   }
  // }
}

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