import 'package:flutter/material.dart';
import 'animagte_icon.dart';
import 'edge_alerts.dart';
import 'overlay_view.dart';

class EdgeOverlay extends StatefulWidget {
  final String title;
  final String description;
  final int overlayDuration;
  final Gravity gravity;
  final Color backgroundColor;
  final IconData? icon;

  const EdgeOverlay({
    required this.title,
    required this.description,
    required this.overlayDuration,
    required this.gravity,
    required this.backgroundColor,
    this.icon,
  });

  @override
  _EdgeOverlayState createState() => _EdgeOverlayState();
}

class _EdgeOverlayState extends State<EdgeOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<Offset> _positionTween;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    if (widget.gravity == Gravity.top) {
      _positionTween =
          Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero);
    } else {
      _positionTween = Tween<Offset>(
          begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0));
    }

    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _controller.forward();

    listenToAnimation();
  }

  void listenToAnimation() {
    _controller.addStatusListener((listener) async {
      if (listener == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: widget.overlayDuration));
        _controller.reverse();
        await Future.delayed(const Duration(milliseconds: 700));
        OverlayView.dismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _medaQuery = MediaQuery.of(context);
    final statusBarHeight = _medaQuery.padding.top;
    final bottomHeight = _medaQuery.padding.bottom;
    final isTop = widget.gravity == Gravity.top;

    return Positioned(
      top: isTop ? 0 : null,
      bottom: !isTop ? 0 : null,
      child: SlideTransition(
        position: _positionAnimation,
        child: Container(
          width: _medaQuery.size.width,
          padding: EdgeInsets.fromLTRB(
            20,
            isTop ? statusBarHeight + 20 : bottomHeight + 20,
            20,
            isTop ? 20 : 35,
          ),
          color: widget.backgroundColor,
          child: OverlayWidget(
            title: widget.title,
            description: widget.description,
            iconData: widget.icon,
          ),
        ),
      ),
    );
  }
}

class OverlayWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData? iconData;

  const OverlayWidget({
    this.title = '',
    this.description = '',
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    print(iconData == null);
    return Material(
      type: MaterialType.transparency,
      child: Row(
        children: <Widget>[
          if (iconData != null) EdgeAnimatedIcon(iconData: iconData!),
          const Padding(padding: EdgeInsets.only(right: 15)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              if (description.isNotEmpty)
                Text(
                  description,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
            ],
          )),
        ],
      ),
    );
  }
}
