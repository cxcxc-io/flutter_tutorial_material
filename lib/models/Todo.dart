
class Todo {

  String title; // 待辦事項的標題
  bool _isCompleted=false; // 表示待辦事項是否已完成的布林值

  // Todo class 的建構子，需要傳入待辦事項的標題，並可選傳入是否已完成的狀態（預設為未完成）
  Todo(
      this.title,
      this._isCompleted
      );

  // 對私有變數 _isComplete 取得狀態
  bool isCompleted(){
    return this._isCompleted;
  }

  // 將待辦事項標記為已完成
  void markAsCompleted() {
    _isCompleted = true;
    print('Todo "$title" 已標記為已完成');
  }

  // 將待辦事項標記為未完成
  void markAsIncomplete() {
    _isCompleted = false;
    print('Todo "$title" 已標記為未完成');
  }

  // 將 Todo 物件轉換為 Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': _isCompleted ? 1 : 0,
    };
  }

  // 從 Map 創建 Todo 物件
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['title'],
      map['isCompleted'] == 1 ? true : false,
    );
  }

  // 覆寫 toString() 方法，將待辦事項轉換為字串表示，包括標題和完成狀態
  @override
  String toString() {
    return '${_isCompleted ? '[X]' : '[ ]'} $title';
  }
}