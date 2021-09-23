import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

/// Animates its child into and out of a visible state (opacity, scale,offset and angle)
class EntryExit extends StatefulWidget {
  /// The child to animate
  final Widget child;

  /// The delay before animating
  final Duration delay;

  /// The duration of the animation
  final Duration duration;

  /// The reverse duration of the animation
  final Duration? closeDuration;

  /// The animation curve
  final Curve curve;

  /// The initial opacity (goes from [opacity] to 1)
  final double opacity;

  /// The initial scale (goes from [scale] to 1)
  final double scale;

  /// The initial horizontal offset (goes from [xOffset] to 0)
  final double xOffset;

  /// The initial vertical offset (goes from [yOffset] to 0)
  final double yOffset;

  /// The initial angle
  final double angle;

  /// The visible state of the child widget
  final bool visible;

  /// Default constructor (motionless by default)
  const EntryExit({
    Key? key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 300),
    this.closeDuration,
    this.curve = Curves.ease,
    this.opacity = 1,
    this.scale = 1,
    this.xOffset = 0,
    this.yOffset = 0,
    this.angle = 0,
    required this.visible,
    required this.child,
  })  : assert(opacity >= 0 && opacity <= 1),
        super(key: key);

  /// Constructor making use of every animation by default except [angle]
  const EntryExit.all({
    Key? key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 300),
    this.closeDuration,
    this.curve = Curves.ease,
    this.opacity = 0,
    this.scale = 0,
    this.xOffset = 0,
    this.yOffset = 150,
    this.angle = 0,
    this.visible = true,
    required this.child,
  }) : super(key: key);

  /// Opacity-only constructor
  const EntryExit.opacity({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Duration? closeDuration,
    Curve curve = Curves.ease,
    double opacity = 0,
    required bool visible,
    required Widget child,
  }) : this(
          key: key,
          delay: delay,
          duration: duration,
          closeDuration: closeDuration,
          curve: curve,
          opacity: opacity,
          child: child,
          yOffset: 0,
          scale: 1,
          visible: visible,
        );

  /// Scale-only constructor
  const EntryExit.scale({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Duration? closeDuration,
    Curve curve = Curves.ease,
    double scale = 0,
    required bool visible,
    required Widget child,
  }) : this(
          key: key,
          delay: delay,
          duration: duration,
          closeDuration: closeDuration,
          curve: curve,
          scale: scale,
          child: child,
          yOffset: 0,
          opacity: 1,
          visible: visible,
        );

  /// Offset-only constructor
  const EntryExit.offset({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Duration? closeDuration,
    Curve curve = Curves.ease,
    double xOffset = 0,
    double yOffset = 1000,
    required bool visible,
    required Widget child,
  }) : this(
          key: key,
          delay: delay,
          duration: duration,
          closeDuration: closeDuration,
          curve: curve,
          xOffset: xOffset,
          yOffset: yOffset,
          child: child,
          opacity: 1,
          scale: 1,
          visible: visible,
        );

  @override
  State<StatefulWidget> createState() => _EntryExitState();
}

class _EntryExitState extends State<EntryExit> {
  late bool _visible = widget.visible;
  Timer? _timer;

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.visible) {
      if (!oldWidget.visible && _visible) {
        // rebuild when the portal is in progress of being hidden
      } else if (oldWidget.visible) {
        _timer?.cancel();
        _timer = Timer(widget.closeDuration ?? widget.duration, () {
          if(mounted) setState(() => _visible = false);
        });
      } else {
        _visible = false;
      }
    } else {
      _timer?.cancel();
      _timer = null;
      _visible = widget.visible;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// The state of the child in the widget tree

    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: widget.opacity, end: 1.0), widget.duration, widget.curve)
      ..add("scale", Tween(begin: widget.scale, end: 1.0), widget.duration, widget.curve)
      ..add("xOffset", Tween(begin: widget.xOffset, end: 0.0), widget.duration, widget.curve)
      ..add("yOffset", Tween(begin: widget.yOffset, end: 0.0), widget.duration, widget.curve)
      ..add("angle", Tween(begin: widget.angle, end: 0.0), widget.duration, widget.curve);

    return CustomAnimation<MultiTweenValues<String>>(
      control: widget.visible ? CustomAnimationControl.play : CustomAnimationControl.playReverse,
      delay: widget.delay,
      duration: tween.duration,
      tween: tween,
      child: _visible ? widget.child : null,
      builder: (context, child, value) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.scale(
          scale: value.get("scale"),
          child: Transform.translate(
            offset: Offset(
              value.get("xOffset"),
              value.get("yOffset"),
            ),
            child: Transform.rotate(angle: value.get("angle"), child: child),
          ),
        ),
      ),
    );
  }
}
