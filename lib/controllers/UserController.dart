import 'package:flutter/material.dart';
import 'package:flutter_tutorial_matrial/screens/UserLoginScreen.dart';
import '../screens/UserInfoScreen.dart';
import '../screens/UserNoteScreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';

class UserController {

   // 以後會用來做偵測用戶登入等安全驗證
   static bool checkUserLogin(){
     return false;
   }

   static Widget userInfoScreen(){
     return UserInfoScreen();
   }

   static Widget userNoteScreen(){
     return UserNoteScreen();
   }

   static Widget userLoginScreen() {

      checkUserLogin();

      String userAgent ='';
      if (kIsWeb==true){
        userAgent="web";
      }else{
        userAgent = Platform.operatingSystem;
      }

      ///   "android"
      ///   "fuchsia"
      ///   "ios"
      ///   "linux"
      ///   "macos"
      ///   "windows"
      print(userAgent);
      if (userAgent.toLowerCase().contains('android')) {
        print('使用者使用android手機');
        return UserLoginScreen();
      } else if (userAgent.toLowerCase().contains('ios')) {
        print('使用者使用ios');
        return UserLoginScreen();
      } else if (userAgent.toLowerCase().contains('linux')) {
        print('使用者使用linux');
        return UserLoginScreen();
      }else if (userAgent.toLowerCase().contains('macos')) {
        print('使用者使用macos');
        return UserLoginScreen();
      }else if (userAgent.toLowerCase().contains('windows')) {
        print('使用者使用windows');
        return UserLoginScreen();
      } else {
        print('無法識別使用者的載具');
        return UserLoginScreen();
      }
  }
}
