import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:redux/redux.dart';

class ConferenceState {
  bool isLoading;
  List<String> ids;
  // Map<String, Conference> conferences;
  List<Conference> conferences;

  ConferenceState({
    this.isLoading = false,
    // this.ids = const [],
    // this.conferences = const {},
    this.conferences = const [],
  });

  // factory ConferenceState.cloneFromOld(ConferenceState old,
  //         {bool newIsLoading}) =>
  //     ConferenceState(isLoading: newIsLoading ?? old.isLoading);
}

class Action {
  String type;
  dynamic any;
}

class SuccessConferenceAction {
  final List<Conference> conferences;
  SuccessConferenceAction(this.conferences);
}

enum Actions {
  requestConferences,
  errorConferences,
}

ConferenceState conferenceReducer(ConferenceState state, action) {
  if (action is SuccessConferenceAction) {
    print('eee');
    print(action.conferences.map((Conference conf) => conf.id));
    return new ConferenceState(
        isLoading: false,
        // ids: action.conferences.map((Conference conf) => conf.id),
        conferences: action.conferences);
        // conferences: new Map.fromIterable(action.conferences,
        //     key: (v) => v.id, value: (v) => v));
  } else if (action == Actions.requestConferences) {
    return new ConferenceState(isLoading: true);
  } else if (action == Actions.errorConferences) {
    return new ConferenceState(isLoading: false);
  } else {
    return state;
  }
}

loggingMiddleware(Store<int> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');

  next(action);
}
