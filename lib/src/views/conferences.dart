import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/bloc/conferences/conference.dart';
import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:monkey_tech_day/src/providers/conference.dart';
import 'package:monkey_tech_day/src/providers/root.dart';
import 'package:monkey_tech_day/src/utils/platform_app_bar.dart';
import 'package:monkey_tech_day/src/views/conference.dart';

class ConferencesView extends StatefulWidget {
  static const routeName = '/';

  final String title = 'MonkeyConf';

  @override
  _ConferencesViewState createState() => _ConferencesViewState();
}

class _ConferencesViewState extends State<ConferencesView> {
  @override
  Widget build(BuildContext context) {
    final monkeyConfRootProvider = MonkeyConfRootProvider.of(context);
    final conferencesBloc = monkeyConfRootProvider.conferencesBloc;
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: StreamBuilder<List<Conference>>(
        initialData: conferencesBloc.conferences.value,
        stream: conferencesBloc.conferences,
        builder: (context, snapshot) {
          if (snapshot.data.isEmpty) {
            return Center(child: Text('No conferences'));
          }
          return ListView(
            children: snapshot.data
                .map(
                  (c) => ConferenceProvider(
                        child: ConferenceWidget(),
                        conferenceBloc: ConferenceBloc(c),
                      ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

class ConferenceWidget extends StatelessWidget {
  ConferenceWidget();

  @override
  Widget build(BuildContext context) {
    final conferenceBloc = ConferenceProvider.of(context).conferenceBloc;
    final monkeyConfRootProvider = MonkeyConfRootProvider.of(context);
    final selectedConferenceBloc =
        monkeyConfRootProvider.selectedConferenceBloc;
    return InkWell(
      onTap: () async {
        selectedConferenceBloc.selectConference
            .add(conferenceBloc.conference.value);
        Navigator.of(context).pushNamed(ConferenceView.routeName);
      },
      child: _buildContent(conferenceBloc),
    );
  }

  Widget _buildContent(ConferenceBloc conferenceBloc) {
    return StreamBuilder<Conference>(
      initialData: conferenceBloc.conference.value,
      stream: conferenceBloc.conference,
      builder: (context, conferenceSnapshot) => ListTile(
            leading: Column(
              children: <Widget>[
                Text(
                  conferenceSnapshot.data.startTime,
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  conferenceSnapshot.data.endTime,
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            title: Text(conferenceSnapshot.data.title),
            subtitle: StreamBuilder<String>(
              initialData: conferenceBloc.subtitle.value,
              stream: conferenceBloc.subtitle,
              builder: (context, subtitleSnapshot) =>
                  Text(subtitleSnapshot.data),
            ),
          ),
    );
  }
}
