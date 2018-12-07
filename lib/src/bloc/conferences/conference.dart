import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:rxdart/rxdart.dart';

class ConferenceBloc {
  ConferenceBloc(Conference conference) {
    _conference.add(conference);
  }

  final _conference = BehaviorSubject<Conference>();

  BehaviorSubject<String> _subtitle;

  ValueObservable<Conference> get conference => _conference.stream;

  ValueObservable<String> get subtitle => _conference.map((c) {
        final sb = StringBuffer();
        sb.write(c.speakers.map((s) => s.fullName).join(', '));
        if (c.room?.name?.isNotEmpty == true) {
          sb.write(', ');
          sb.write(c.room.name);
        }
        return sb.toString();
      }).shareValue(seedValue: '');

  ValueObservable<String> get stringifySpeaker => _conference
      .map((c) => c.speakers.map((s) => s.fullName).join(', '))
      .shareValue(seedValue: '');

  ValueObservable<String> get hour => _conference
      .map((c) => '${c.startTime} - ${c.endTime}')
      .shareValue(seedValue: '');

  ValueObservable<String> get roomThemesDifficulty => _conference.map((c) {
        final sb = StringBuffer(c.room.name);
        if (c.techInfo != null) {
          sb.write(
              ' : ${c.techInfo.themes.join(',')} - ${_difficultyToString(c.techInfo.difficulty)}');
        }
        return sb.toString();
      }).shareValue(seedValue: '');

  Future<void> dispose() async {
    await Future.wait(
      [
        _subtitle.close(),
        _conference.close(),
      ],
    );
  }

  String _difficultyToString(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.EASY:
        return 'easy';
      case Difficulty.MEDIUM:
        return 'medium';
      case Difficulty.HARD:
        return 'hard';
    }
    return '';
  }
}
