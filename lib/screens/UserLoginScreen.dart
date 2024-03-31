import 'package:flutter/material.dart';
import 'package:flutter_tutorial_matrial/components/CommonDrawerComponent.dart';
import 'package:flutter_tutorial_matrial/daos/UserDao.dart'; // 引入 UserDao
import 'package:provider/provider.dart';

import '../models/User.dart'; // 引入 User 模型

class UserLoginScreen extends StatefulWidget {
  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late TextEditingController _emailController;

  User? user;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 添加一條Log以顯示已進入build方法
    print('進入 build 方法');

    return Scaffold(
      appBar: AppBar(
        title: Text('Email Input'),
      ),
      drawer: CommonDrawerComponent(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text.trim();
                if (email.isNotEmpty && email.contains('@')) {
                  // 邮箱有效，进行下一步操作（例如导航到下一个页面）
                  print('Valid email: $email');

                  // 在進行下一步操作之前，建立用戶對象並將其存儲到Provider中
                  setState(() {
                    user = User(email);
                    context.read<UserDao>().writeUser(user!);
                  });

                  // 導航到下一個頁面（userinfo）
                  Navigator.pushNamed(context, '/userinfo');
                } else {
                  // 邮箱無效，顯示錯誤提示
                  print('Invalid email: $email');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a valid email'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
