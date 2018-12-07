import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/utils/platform_specific.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({@required this.title, this.previousPageTitle});

  final String title;
  final String previousPageTitle;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: _buildMaterialAppBar(title),
      ios: _buildCupertinoAppBar(
        title,
        previousPageTitle: previousPageTitle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

Widget _buildMaterialAppBar(String title) {
  return AppBar(
    title: Text(title),
  );
}

Widget _buildCupertinoAppBar(String title, {String previousPageTitle}) {
  return CupertinoNavigationBar(
    middle: Text(title),
    previousPageTitle: previousPageTitle,
    border: Border(bottom: BorderSide(color: Colors.blueGrey)),
  );
}
