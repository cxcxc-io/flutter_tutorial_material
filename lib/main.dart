import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/UserController.dart'; // 引入 UserController
import 'daos/UserDao.dart'; // 引入 UserDao

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDao()), // 使用 Provider 管理 UserDao
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // 添加一條Log以顯示已進入 build 方法
    print('進入 build 方法');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // 定義路由表
        '/': (context) => UserController.userLoginScreen(), // 跳轉到用戶登錄頁面
        '/userinfo': (context) => UserController.userInfoScreen(), // 跳轉到用戶資訊頁面
        '/usernote': (context) => UserController.userNoteScreen() // 跳轉到用戶筆記頁面
      },
      initialRoute: '/', // 初始路由設定為用戶登錄頁面
    );
  }
}
