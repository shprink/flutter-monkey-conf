import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/utils/platform_app_bar.dart';

class ConferencesView extends StatefulWidget {
  static const routeName = '/';

  final String title = 'MonkeyConf';

  @override
  _ConferencesViewState createState() => _ConferencesViewState();
}

class _ConferencesViewState extends State<ConferencesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      //  TODO: lister les conferences
      body: Center(
        child: Text('Conferences list'),
      ),
      floatingActionButton: FlatButton(
        child: Text('Go to conference details'),
        onPressed: () {
          Navigator.of(context).pushNamed('/conference');
        },
      ),
    );
  }
}
