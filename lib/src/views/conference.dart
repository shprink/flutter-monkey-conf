import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/bloc/conferences/conference.dart';
import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:monkey_tech_day/src/providers/conference.dart';
import 'package:monkey_tech_day/src/providers/root.dart';
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
    final monkeyConfRootProvider = MonkeyConfRootProvider.of(context);
    final selectedConferenceBloc =
        monkeyConfRootProvider.selectedConferenceBloc;
    return StreamBuilder<Conference>(
      initialData: selectedConferenceBloc.conference.value,
      stream: selectedConferenceBloc.conference,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: CustomAppBar(
            title: snapshot.data.title,
            previousPageTitle: 'Conferences',
          ),
          body: ConferenceProvider(
            child: ConferenceDetailWidget(),
            conferenceBloc: ConferenceBloc(snapshot.data),
          ),
        );
      },
    );
  }
}

class ConferenceDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final conferenceBloc = ConferenceProvider.of(context).conferenceBloc;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<String>(
            initialData: conferenceBloc.stringifySpeaker.value,
            stream: conferenceBloc.stringifySpeaker,
            builder: (context, snapshot) => Text(
                  snapshot.data,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
          ),
          StreamBuilder<String>(
            initialData: conferenceBloc.hour.value,
            stream: conferenceBloc.hour,
            builder: (context, snapshot) => Text(
                  snapshot.data,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: StreamBuilder<String>(
              initialData: conferenceBloc.roomThemesDifficulty.value,
              stream: conferenceBloc.roomThemesDifficulty,
              builder: (context, snapshot) => Text(
                    snapshot.data,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
            ),
          ),
          Text(conferenceBloc.conference.value.description),
        ],
      ),
    );
  }
}
