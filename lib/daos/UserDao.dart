import 'package:flutter/foundation.dart';
import '../models/User.dart'; // 引入 User 模型

class UserDao extends ChangeNotifier {
  User? currentUser; // 用於存儲當前用戶

  // 寫入用戶資訊的方法
  Future<void> writeUser(User user) async {
    // 將傳入的用戶資訊設定為當前用戶
    currentUser = user;

    // 在資訊更新後通知所有依賴於這個 Provider 的小部件進行重構
    notifyListeners();

    // 添加一條 Log 以顯示已更新用戶資訊
    print('已更新用戶資訊：$currentUser');
  }
}
