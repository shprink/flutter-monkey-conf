import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/utils/platform_app_bar.dart';

class ConferenceView extends StatefulWidget {
  static const routeName = '/conference';

  final title = 'Conference';

  @override
  _ConferenceViewState createState() => _ConferenceViewState();
}

class _ConferenceViewState extends State<ConferenceView> {
  @override
  Widget build(BuildContext context) {
    //  TODO: afficher les details de la conference
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Conference title',
        previousPageTitle: 'Conferences',
      ),
      body: Center(
        child: Text('Conference detail'),
      ),
    );
  }
}
