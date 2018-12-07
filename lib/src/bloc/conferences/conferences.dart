import 'dart:convert';

import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class ConferencesBloc {
  ConferencesBloc() {
    _getConferences
        .doOnData((_) => _loading.add(true))
        .asyncMap((_) => http.get('https://monkeyconf.herokuapp.com/'))
        .map((response) => json.decode(response.body) as List)
        .map((conferences) => conferences
            .map((conference) => Conference.fromJson(conference))
            .toList())
        .doOnData(_conferences.add)
        .doOnData((_) => _loading.add(false))
        .listen(null);
  }

  final _getConferences = PublishSubject<void>();

  final _loading = BehaviorSubject<bool>(seedValue: false);

  final _conferences = BehaviorSubject<List<Conference>>(seedValue: []);

  Sink<void> get getConferences => _getConferences.sink;

  ValueObservable<List<Conference>> get conferences => _conferences.stream;

  ValueObservable<bool> get loading => _loading.stream;

  Future<void> dispose() async {
    await Future.wait(
      [
        _conferences.close(),
        _getConferences.close(),
        _loading.close(),
      ],
    );
  }
}
