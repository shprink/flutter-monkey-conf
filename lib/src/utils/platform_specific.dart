import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlatformWidget extends StatelessWidget {
  PlatformWidget({
    @required this.android,
    @required this.ios,
  });

  final Widget android;
  final Widget ios;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return ios;
    }
    return android;
  }
}
