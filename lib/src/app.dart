import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/bloc/conferences/conferences.dart';
import 'package:monkey_tech_day/src/bloc/conferences/selected_conference.dart';
import 'package:monkey_tech_day/src/providers/root.dart';
import 'package:monkey_tech_day/src/utils/platform_app.dart';
import 'package:monkey_tech_day/src/utils/platform_loader.dart';
import 'package:monkey_tech_day/src/views/conference.dart';
import 'package:monkey_tech_day/src/views/conferences.dart';

class MonkeyConf extends StatefulWidget {
  final String appName = 'MonkeyConf';

  @override
  _MonkeyConfState createState() => _MonkeyConfState();
}

class _MonkeyConfState extends State<MonkeyConf> {
  ConferencesBloc conferencesBloc;
  SelectedConferenceBloc selectedConferenceBloc;

  @override
  void initState() {
    super.initState();
    conferencesBloc = ConferencesBloc();
    conferencesBloc.getConferences.add(null);
    selectedConferenceBloc = SelectedConferenceBloc();
  }

  @override
  Widget build(BuildContext context) {
    return MonkeyConfRootProvider(
      conferencesBloc: conferencesBloc,
      selectedConferenceBloc: selectedConferenceBloc,
      child: CustomApp(
        appName: widget.appName,
        buildHome: _buildHome,
        routes: _generateRoute(),
      ),
    );
  }

  Widget _buildHome(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: conferencesBloc.loading.value,
      stream: conferencesBloc.loading,
      builder: (context, snapshot) {
        if (snapshot.data) {
          return Scaffold(
            body: Center(
              child: CustomLoader(),
            ),
          );
        }
        return ConferencesView();
      },
    );
  }

  Map<String, WidgetBuilder> _generateRoute() => {
        '/conference': (context) => ConferenceView(),
      };
}
