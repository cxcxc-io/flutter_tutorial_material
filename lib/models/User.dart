
class User {

  String userEmail; // 待辦事項的標題


  // Todo class 的建構子，需要傳入待辦事項的標題，並可選傳入是否已完成的狀態（預設為未完成）
  User(
      this.userEmail,

      );


  // 將 Todo 物件轉換為 Map
  Map<String, dynamic> toMap() {
    return {
      'userEmail': userEmail
    };
  }

  // 從 Map 創建 Todo 物件
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['userEmail']
    );
  }

  // 覆寫 toString() 方法，將待辦事項轉換為字串表示，包括標題和完成狀態
  @override
  String toString() {
    return ' user email is $userEmail';
  }
}