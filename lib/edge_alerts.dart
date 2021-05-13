library edge_alerts;

import 'package:flutter/material.dart';

import 'overlay_view.dart';

enum Gravity { top, bottom }

void edgeAlert(
  BuildContext context, {
  String title = '',
  String description = '',
  Color? backgroundColor,
  int duration = 1,
  Gravity gravity = Gravity.top,
  IconData? icon,
}) {
  OverlayView.createView(
    context,
    title: title,
    description: description,
    duration: duration,
    gravity: gravity,
    backgroundColor: backgroundColor,
    icon: icon,
  );
}
