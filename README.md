# flutter_tutorial_matrial

for cxcxc student practice.

## Getting Started

這是多頁面無狀態管理的初始內容， 多頁面設計， 也是多頁面狀態管理的入門

todolist 這個項目，多了兩個頁面， 當用戶要使用的時候，必須經過登入頁，登入之後，有用戶資訊頁，這個頁面應該要看到用戶剛剛註冊的email，另外還有先前製作的todolist管理畫面

每個頁面都需要有側邊欄，可供跳轉到其他頁面

### 實踐方式

#### 先把路徑導向順序完成，使開發的時候，可以轉導向到各頁面觀看成果

先在screens內追加兩個空的screen, UserInfoScreen,  UserLoginScreen

再回到controllers的UserController，設置四個方法 checkUserLogin, userInfoScreen, userLoginScreen, userNoteScreen， 未來持續在這裡對用戶的訪問做驗證與過濾

再回到main.dart，設定路由 

另外在components內設定 一個CommonDrawerComponent, 用來做側邊欄，並在裡面的按鍵，設定切換頁面


#### screen內容填補

UserLoginScreen， 讓用戶可輸入email做登入，並將email存在其登入頁面中。

UserInfoScreen ，讀取用戶剛剛輸入的email，做畫面渲染

#### UserController內容填補

為controller分別設定導流到四個頁面的方法