import 'package:flutter/material.dart';

class EdgeAnimatedIcon extends StatefulWidget {
  final IconData iconData;

  const EdgeAnimatedIcon({
    required this.iconData,
  });

  @override
  _EdgeAnimatedIconState createState() => _EdgeAnimatedIconState();
}

class _EdgeAnimatedIconState extends State<EdgeAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.1,
      duration: const Duration(milliseconds: 600),
    );

    _controller.forward();
    listenToAnimation();
  }

  void listenToAnimation() {
    _controller.addStatusListener((listener) {
      if (listener == AnimationStatus.completed) {
        _controller.reverse();
      }
      if (listener == AnimationStatus.dismissed) {
        _controller.forward();
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) => Transform.scale(
        scale: _controller.value,
        child: widget,
      ),
      child: Icon(
        widget.iconData,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
