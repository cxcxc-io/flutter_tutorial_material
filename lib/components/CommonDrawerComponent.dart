import 'package:flutter/material.dart';

class CommonDrawerComponent extends StatelessWidget {

  final String title = "側邊功能列";
  final String headerText;
  final Widget? headerWidget;

  CommonDrawerComponent({
    // required this.drawerItems,
    // required this.title,
    this.headerText = '',
    this.headerWidget,
  });

  @override
  Widget build(BuildContext context) {

    final List<DrawerItem> drawerItems=[
      DrawerItem(title: "用戶主頁", icon: Icons.people,onTap: (){Navigator.pushNamed(context, '/userinfo');}),
      DrawerItem(title: "用戶備忘錄", icon: Icons.note, onTap: (){Navigator.pushNamed(context, '/usernote');}),
    ];

    Widget _buildDrawerItems = Column(
      children: drawerItems.map((item) {
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            Navigator.pop(context); // 关闭侧边栏
            item.onTap?.call();
          },
        );
      }).toList(),
    );

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(context),
          Divider(),
          _buildDrawerItems,
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: headerWidget ??
          Text(
            headerText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
    );
  }


}

class DrawerItem {
  final String title;
  final IconData icon;
  final Function? onTap;

  DrawerItem({
    required this.title,
    required this.icon,
    this.onTap,
  });
}
