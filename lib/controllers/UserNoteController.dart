import 'package:flutter/material.dart';
import '../screens/UserNoteScreen.dart';

class UserController {
  Widget handleUserDevice(String userAgent) {
    if (userAgent.toLowerCase().contains('mobile')) {
      print('使用者使用手機');
      return UserNoteScreen(deviceType: '手機');
    } else if (userAgent.toLowerCase().contains('tablet')) {
      print('使用者使用平板');
      return UserNoteScreen(deviceType: '平板');
    } else if (userAgent.toLowerCase().contains('desktop')) {
      print('使用者使用桌面電腦');
      return UserNoteScreen(deviceType: '桌面電腦');
    } else {
      print('無法識別使用者的載具');
      return UserNoteScreen(deviceType: '未知');
    }
  }
}
