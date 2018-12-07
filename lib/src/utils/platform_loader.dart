import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/utils/platform_specific.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: CircularProgressIndicator(),
      ios: CupertinoActivityIndicator(),
    );
  }
}
