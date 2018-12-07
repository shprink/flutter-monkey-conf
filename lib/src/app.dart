import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/views/conference.dart';
import 'package:monkey_tech_day/src/views/conferences.dart';

class MonkeyConf extends StatefulWidget {
  final String appName = 'MonkeyConf';

  @override
  _MonkeyConfState createState() => _MonkeyConfState();
}

class _MonkeyConfState extends State<MonkeyConf> {
  @override
  Widget build(BuildContext context) {
    // TODO completer l'application
    return MaterialApp(
      home: ConferencesView(),
      routes: _generateRoute(),
    );
  }

  Map<String, WidgetBuilder> _generateRoute() => {
        '/conference': (context) => ConferenceView(),
      };
}
