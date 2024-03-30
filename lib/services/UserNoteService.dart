import "../models/Todo.dart";
import '../daos/TodoDao.dart';

class UserNoteService {
  final TodoDao _todoDao;

  // 這個寫法就是在UserNoteService 建構子被調用之前，使用初始化列表將 _todoDao 成員變數初始化為一個新創建的 TodoDao 物件。
  UserNoteService() : _todoDao = TodoDao();


  // 讀取待辦事項列表
  Future<List<Todo>> readTodos() async {

    // 一個好的記事表，會在用戶讀取todo之後，觸發一連串的反應，比如為了優化效能，把內容放在緩存，最少，也是記錄Log

    return await _todoDao.readTodos();
  }

  // 寫入待辦事項列表
  Future<void> writeTodoAndDoMore(Todo todo) async {

    // 一個好的記事表，會在用戶寫入todo之後，觸發一連串的反應，以後在這裡可能會調度其他外部系統，或是寄發email給相關用戶
    String note = 'Todo: ${todo.title}, isCompleted: ${todo.isCompleted()}';
    print('已將待辦事項紀錄到筆記中: $note');

    await _todoDao.writeTodo(todo);
  }

  Future<void> removeTodoAndDoMore(Todo todo) async{

    // 一個好的記事表，會在用戶寫入todo之後，觸發一連串的反應，以後在這裡可能會調度其他外部系統，或是寄發email給相關用戶
    String note = 'Todo: ${todo.title}, isCompleted: ${todo.isCompleted()} ';
    print('已將待辦事項從筆記中刪除: $note');
    await _todoDao.removeTodo(todo);
  }

}