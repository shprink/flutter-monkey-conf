import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:monkey_tech_day/src/models/conference.dart';
import 'package:monkey_tech_day/src/utils/platform_app_bar.dart';

class ConferenceView extends StatefulWidget {
  static const routeName = '/conference';
  final Conference conference;

  ConferenceView({Key key, @required this.conference});

  @override
  _ConferenceViewState createState() => _ConferenceViewState();
}

class _ConferenceViewState extends State<ConferenceView> {
  @override
  Widget build(BuildContext context) {
    //  TODO: afficher les details de la conference
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.conference.title,
        previousPageTitle: 'Conferences',
      ),
      body: ListView(
        children: [
          Image.network(
            'https://pbs.twimg.com/profile_banners/87416143/1542147649/600x200',
            height: 240.0,
            fit: BoxFit.cover,
          ),
          ListTile(
            leading: const Icon(Icons.title),
            title: Text(widget.conference.title),
            subtitle: Text(
                '${widget.conference.speakers[0].firstName} ${widget.conference.speakers[0].lastName}'),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text('''
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac diam dapibus, feugiat felis non, vulputate augue. Nunc commodo sed lacus sit amet vehicula. Donec ultricies nisl quis ipsum fermentum aliquet. Nulla auctor dolor ut imperdiet dapibus. Maecenas purus tellus, scelerisque vitae dapibus non, efficitur a magna. Praesent vitae luctus sem. Aliquam eget ligula et libero vehicula viverra eu sed nisl. Nullam faucibus eu augue at volutpat. Nam et dolor vitae ipsum bibendum laoreet.

            Vivamus ac magna non augue finibus semper eget tincidunt turpis. Proin viverra tortor ex. Maecenas hendrerit nulla non dictum posuere. Quisque bibendum sed orci nec commodo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ultrices dolor aliquet varius luctus. Nulla facilisis eu elit ac suscipit. Maecenas quis sem sem. Etiam vitae tincidunt lorem. Aenean porttitor lectus quis dui eleifend, at vestibulum tortor tempus. Nullam convallis urna in arcu rhoncus congue. Duis et ullamcorper magna. Suspendisse id dignissim augue, at sodales mi.
           ''', softWrap: true, textAlign: TextAlign.left, ),
          )
        ],
      ),
    );
  }
}
