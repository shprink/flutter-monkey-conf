import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/redux/reducers/conferences.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:monkey_tech_day/src/views/conference.dart';
import 'package:monkey_tech_day/src/views/conferences.dart';

// class MonkeyConf extends StatefulWidget {
//   final String appName = 'MonkeyConf';

//   @override
//   _MonkeyConfState createState() => _MonkeyConfState();
// }

class MonkeyConf extends StatelessWidget {
  final String appName = 'MonkeyConf';
  final Store<ConferenceState> store;

  MonkeyConf(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<ConferenceState>(
        store: store,
        child: MaterialApp(
          home: ConferencesView(),
          routes: _generateRoute(),
        ));
  }

  Map<String, WidgetBuilder> _generateRoute() => {
        '/conference': (context) => ConferenceView(),
      };
}

// class _MonkeyConfState extends State<MonkeyConf> {
//   @override
//   Widget build(BuildContext context) {
//     //  TODO: recuperer les talks
//     //  l'url est la suivant https://monkeyconf.herokuapp.com/
//     //
//     return MaterialApp(
//       home: ConferencesView(),
//       routes: _generateRoute(),
//     );
//   }

//   Map<String, WidgetBuilder> _generateRoute() => {
//         '/conference': (context) => ConferenceView(),
//       };
// }
