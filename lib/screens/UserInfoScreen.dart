import 'package:flutter/material.dart';
import 'package:flutter_tutorial_matrial/components/CommonDrawerComponent.dart';
import 'package:provider/provider.dart';

import '../daos/UserDao.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  State createState() {
    return _UserInfoScreenState();
  }
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  String userEmail = '用戶Email沒有傳導到這個頁面來';

  _UserInfoScreenState();

  @override
  Widget build(BuildContext context) {
    // 添加一條Log以顯示已進入build方法
    print('進入 build 方法');

    // 使用 Provider 讀取 UserDao 以取得用戶資訊
    userEmail = context.read<UserDao>().currentUser!.userEmail;

    // 添加一條Log以顯示已獲取用戶電子郵件
    print('用戶電子郵件：$userEmail');

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      drawer: CommonDrawerComponent(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Email:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              userEmail,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
