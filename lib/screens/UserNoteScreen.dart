import 'package:flutter/material.dart';
import '../models/Todo.dart';
import '../services/UserNoteService.dart';
import '../components/TodoCheckComponent.dart'; // 导入 TodoCheckComponent 组件

import '../components/CommonDrawerComponent.dart';

class UserNoteScreen extends StatefulWidget {
  String? deviceType;

  UserNoteScreen({this.deviceType});

  @override
  _UserNoteScreenState createState() => _UserNoteScreenState();
}

class _UserNoteScreenState extends State<UserNoteScreen> {
  final UserNoteService _userNoteService = UserNoteService();
  final TextEditingController _todoController = TextEditingController();

  // 状态变量
  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    _todos = await _userNoteService.readTodos();
    setState(() {}); // 更新畫面
  }

  Future<void> _addTodo() async {
    String todoTitle = _todoController.text.trim();
    if (todoTitle.isNotEmpty) {
      Todo newTodo = Todo(todoTitle, false);
      await _userNoteService.writeTodoAndDoMore(newTodo); // 紀錄到筆記中
      _todoController.clear();
      setState(() {}); // 更新畫面
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用者筆記'),
      ),
      // 側邊欄Demo
      drawer: CommonDrawerComponent(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                labelText: '新增待辦事項',
              ),
              onSubmitted: (_) => _addTodo(),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) { // 如果屏幕宽度大于 600，则使用垂直列表布局
                    return ListView.builder(
                      itemCount: _todos.length,
                      itemBuilder: (context, index) {
                        final todo = _todos[index];
                        return TodoCheckComponent(
                          todo: todo,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                todo.markAsCompleted();
                              } else {
                                todo.markAsIncomplete();
                              }
                              _userNoteService.writeTodoAndDoMore(todo);
                            });
                          },
                          onRemoved: () {
                            setState(() {
                              _userNoteService.removeTodoAndDoMore(todo);
                            });
                          },
                        );
                      },
                    );
                  } else { // 否则使用卡片布局
                    return ListView(
                      children: _todos.map((todo) {
                        return Card(
                          child: ListTile(
                            title: Text(todo.title),
                            trailing: Checkbox(
                              value: todo.isCompleted(),
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    todo.markAsCompleted();
                                  } else {
                                    todo.markAsIncomplete();
                                  }
                                  _userNoteService.writeTodoAndDoMore(todo);
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                if (todo.isCompleted()) {
                                  todo.markAsIncomplete();
                                } else {
                                  todo.markAsCompleted();
                                }
                                _userNoteService.writeTodoAndDoMore(todo);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
