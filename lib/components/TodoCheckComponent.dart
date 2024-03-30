import 'package:flutter/material.dart';
import '../models/Todo.dart';

class TodoCheckComponent extends StatefulWidget {
  final Todo todo;
  final Function(bool?) onChanged;
  final VoidCallback? onRemoved; // 添加移除按钮的回调

  TodoCheckComponent({required this.todo, required this.onChanged, this.onRemoved});

  @override
  _TodoCheckComponentState createState() => _TodoCheckComponentState();
}

class _TodoCheckComponentState extends State<TodoCheckComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: widget.todo.isCompleted(),
            onChanged: widget.onChanged,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: widget.onRemoved, // 使用移除按钮的回调
          ),
        ],
      ),
    );
  }
}
