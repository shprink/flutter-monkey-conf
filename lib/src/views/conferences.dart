import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:monkey_tech_day/src/redux/reducers/conferences.dart';
import 'package:monkey_tech_day/src/utils/platform_app_bar.dart';
import 'package:monkey_tech_day/src/views/conference.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:convert';

class ConferencesView extends StatefulWidget {
  static const routeName = '/';

  final String title = 'MonkeyConf';

  @override
  _ConferencesViewState createState() => _ConferencesViewState();
}

class SearchScreenViewModel {
  final ConferenceState state;
  final void Function() onInit;
  final void Function(List<Conference> conferences) onLoad;

  SearchScreenViewModel({this.state, this.onInit, this.onLoad});
}

class _ConferencesViewState extends State<ConferencesView> {
  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      //  TODO: lister les conferences
      body: new StoreConnector<ConferenceState, SearchScreenViewModel>(
        onInit: (store) {
          store.dispatch(Actions.requestConferences);
          getConferences().then((conferences) {
            store.dispatch(SuccessConferenceAction(conferences));
          });
        },
        // converter: (store) => store.state.isLoading,
        converter: (store) {
          return SearchScreenViewModel(
            state: store.state,
            onInit: () => store.dispatch(Actions.requestConferences),
            onLoad: (conferences) =>
                store.dispatch(SuccessConferenceAction(conferences)),
          );
        },
        builder: (context, SearchScreenViewModel test) {
          Future loadData() {
            test.onInit();
            return getConferences().then((conferences) {
              test.onLoad(conferences);
            });
          }

          // loadData(true);

          return new RefreshIndicator(
              onRefresh: loadData,
              // onOffsetChange: _onOffsetCallback,
              child: ListView(
                children: <Widget>[]..addAll(test.state.conferences
                    .map((v) => ConferenceRow(v))
                    .toList()),
              ));
        },
      ),
    );
  }

  Future<List<Conference>> getConferences() async {
    final response = await http.get('https://monkeyconf.herokuapp.com/');
    var mapConf = json.decode(response.body) as List;

    return mapConf.map((conference) {
      return Conference.fromJson(conference);
    }).toList();
  }

  // Future<List<Conference>> getConference() async {
  //   final response = await http.get('https://monkeyconf.herokuapp.com/');
  //   // print(response.body);
  //   return json.decode(response.body).map((Map<String, dynamic> conference) {
  //     return Conference.fromJson(conference);
  //   }).toList();
  // }
}

class ConferenceRow extends StatelessWidget {
  Conference conf;
  ConferenceRow(this.conf);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      decoration: const BoxDecoration(
        border: Border(
          // top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
          // left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
          // right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFEEEEEE)),
        ),
        // color: Color(0xFFBFBFBF),
      ),
      padding: const EdgeInsets.all(16.0),
      // color: Colors.green,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    this.conf.startTime,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  this.conf.endTime,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    this.conf.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${this.conf.speakers[0].firstName} ${this.conf.speakers[0].lastName}',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConferenceView(conference: this.conf),
          ),
        );
      },
      child: titleSection,
    );
  }
}
