import 'package:flutter/material.dart';

Route createdroute(pagename) {
  return PageRouteBuilder(
      pageBuilder: (context, animatiaion, secandaryanimation) {
    return pagename;
  }, transitionsBuilder: (context, animation, secandaryanimation, child) {
    return SlideTransition(
      position:
          animation.drive(Tween(begin: Offset(1.0, 0.0), end: Offset.zero)),
      child: child,
    );
  });
}
