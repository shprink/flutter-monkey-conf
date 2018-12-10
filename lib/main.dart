import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/app.dart';
import 'package:redux/redux.dart';
import 'src/redux/reducers/conferences.dart';

void main() {
  final store = new Store<ConferenceState>(conferenceReducer, initialState: ConferenceState());

  runApp(new MonkeyConf(store));
}
