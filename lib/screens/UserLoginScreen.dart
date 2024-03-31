import 'package:flutter/material.dart';
import 'package:flutter_tutorial_matrial/components/CommonDrawerComponent.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  late TextEditingController _emailController;

  String userEmail = '';

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
                  // 这里可以添加导航逻辑，例如 Navigator.push...
                  setState(() {
                    userEmail = email;
                  });
                  Navigator.pushNamed(context, '/userinfo');
                } else {
                  // 邮箱无效，显示错误提示
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