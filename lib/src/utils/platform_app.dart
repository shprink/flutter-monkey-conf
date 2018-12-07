import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/utils/platform_specific.dart';

class CustomApp extends StatelessWidget {
  CustomApp({
    @required this.appName,
    @required this.buildHome,
    @required this.routes,
  });

  final String appName;
  final WidgetBuilder buildHome;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: _buildMaterialApp(appName, context, buildHome, routes),
      ios: _buildCupertinoApp(appName, context, buildHome, routes),
    );
  }

  Widget _buildCupertinoApp(
    String appName,
    BuildContext context,
    WidgetBuilder buildHome,
    Map<String, WidgetBuilder> routes,
  ) {
    return CupertinoApp(
      title: appName,
      home: buildHome(context),
      routes: routes,
    );
  }

  Widget _buildMaterialApp(
    String appName,
    BuildContext context,
    WidgetBuilder buildHome,
    Map<String, WidgetBuilder> routes,
  ) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: buildHome(context),
      routes: routes,
    );
  }
}
