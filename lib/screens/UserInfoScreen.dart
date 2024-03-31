import 'package:flutter/material.dart';
import 'package:flutter_tutorial_matrial/components/CommonDrawerComponent.dart';

class UserInfoScreen extends StatefulWidget{


  @override
  State createState() {
    return _UserInfoScreenState();
  }
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  final String userEmail='用戶Email沒有傳導到這個頁面來'; // 用户的email状态

  _UserInfoScreenState(); // 构造函数

  @override
  Widget build(BuildContext context) {
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
              'User Email:', // 用户email标题
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              userEmail, // 显示用户email状态
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}