import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/Todo.dart'; // 匯入 Todo 類別，假設此類別定義在 models/Todo.dart 檔案中


/*
*
* 一次讀取所有Todo
* 一次寫入個別Todo
*
* 指定好檔案位置
*
* */
class TodoDao {

  static List<Todo> todos=[]; // 代表待辦事項資料的檔案物件

  // 讀取待辦事項列表
  Future<List<Todo>> readTodos() async {

    try {
      final SharedPreferences _prefs = await  SharedPreferences.getInstance();
      // 未來會嘗試從資料庫讀取，會將事情的邏輯寫在這裡，現在是直接從記憶體變數內讀取
      if (todos.length==0){
        List<String>? jsonTodoList = _prefs.getStringList("todoList");
        List<Todo>? jsonTransformTodo =jsonTodoList?.map((todoString) => Todo.fromMap(jsonDecode(todoString))).toList();
        if (jsonTransformTodo!=null){
          todos=jsonTransformTodo;
        }
      }else{

      }
    } catch (e) {
      print('讀取待辦事項時發生錯誤: $e'); // 處理讀取檔案時的錯誤
    }
    return todos; // 返回待辦事項列表
  }

  // 寫入待辦事項列表
  Future<void> writeTodo(Todo todo) async {

    try {
      final SharedPreferences _prefs = await  SharedPreferences.getInstance();
      print(todo);
      if(todos.contains(todo)){
        todos[todos.indexOf(todo)]=todo;
      }else{
        todos.add(todo);
      }

      List<String> todoJsonString = todos.map((todoObject){
        return jsonEncode(todoObject.toMap());
      }).toList();

      _prefs.setStringList("todoList", todoJsonString);

    } catch (e) {
      print('寫入待辦事項時發生錯誤: $e'); // 處理寫入檔案時的錯誤
    }
  }

  // 刪除特定元素
  Future<void> removeTodo(Todo todo) async {
    try {
      final SharedPreferences _prefs = await  SharedPreferences.getInstance();
      print(todo);
      if(todos.contains(todo)){
        todos.removeAt(todos.indexOf(todo));
        print(todos);
        List<String> todoJsonString = todos.map((todoObject){
          return jsonEncode(todoObject.toMap());
        }).toList();

        _prefs.setStringList("todoList", todoJsonString);

      }else{
        print('資料庫內無此Todo');
      }
    } catch (e) {
      print('寫入待辦事項時發生錯誤: $e'); // 處理寫入檔案時的錯誤
    }
  }

}



