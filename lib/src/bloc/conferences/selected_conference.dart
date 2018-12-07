import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:rxdart/rxdart.dart';

class SelectedConferenceBloc {
  final _conference = BehaviorSubject<Conference>();

  Sink<Conference> get selectConference => _conference.sink;

  ValueObservable<Conference> get conference => _conference.stream;

  void dispose() {
    _conference.close();
  }
}
