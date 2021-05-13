import 'package:flutter/material.dart';

import 'edge_alerts.dart';
import 'edge_overlay.dart';

class OverlayView {
  static final OverlayView _singleton = OverlayView._internal();

  factory OverlayView() {
    return _singleton;
  }

  OverlayView._internal();

  static OverlayState? _overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
    BuildContext context, {
    IconData? icon,
    Color? backgroundColor,
    required String title,
    required String description,
    required int duration,
    required Gravity gravity,
  }) {
    _overlayState = Navigator.of(context).overlay;

    if (!_isVisible) {
      _isVisible = true;

      _overlayEntry = OverlayEntry(
        builder: (context) {
          return EdgeOverlay(
            title: title,
            description: description,
            overlayDuration: duration,
            gravity: gravity,
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            icon: icon,
          );
        },
      );

      _overlayState!.insert(_overlayEntry!);
    }
  }

  static void dismiss() {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}
