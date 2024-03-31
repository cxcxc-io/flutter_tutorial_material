# flutter_tutorial_matrial

for cxcxc student practice.

## Getting Started

多頁面引入 provider 作為 多頁面狀態管理

先在pubspec.yaml 引入套件 ，在models內建立User類別，並在daos內建立UserDao類別，並為UserDao設置ChangeNotifier與notifyListeners()

回到main.dart，為app增加provider，告訴所有頁面可以調度此狀態。

再回到UserLoginScreen，當用戶輸入email後，會去更新provider所追蹤的用戶狀態

再回到UserInfoScreen，將要讀取的用戶資料，改為provider所使用的用戶狀態。


