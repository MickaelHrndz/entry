import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

/// Animates its child into a visible state (opacity, scale,offset and angle)
class Entry extends StatelessWidget {
  /// The child to animate
  final Widget child;

  /// The delay before animating
  final Duration delay;

  /// The duration of the animation
  final Duration duration;

  /// The animation curve
  final Curve curve;

  /// The state of visibility
  bool visible;

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

  /// Default constructor (motionless by default)
  Entry({
    Key? key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    this.visible = true,
    this.opacity = 1,
    this.scale = 1,
    this.xOffset = 0,
    this.yOffset = 0,
    this.angle = 0,
    required this.child,
  })  : assert(opacity >= 0 && opacity <= 1),
        super(key: key); // coverage:ignore-line

  /// Constructor making use of every animation by default except [angle] and [xOffset]
  Entry.all({
    Key? key,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    this.visible = true,
    this.opacity = 0,
    this.scale = 0,
    this.xOffset = 0,
    this.yOffset = 150,
    this.angle = 0,
    required this.child,
  }) : super(key: key); // coverage:ignore-line

  /// Opacity-only constructor
  Entry.opacity({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    bool visible = true,
    double opacity = 0,
    required Widget child,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          opacity: opacity,
          child: child,
        );

  /// Scale-only constructor
  Entry.scale({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    bool visible = true,
    double scale = 0,
    required Widget child,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          scale: scale,
          child: child,
        );

  /// Offset-only constructor
  Entry.offset({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    bool visible = true,
    double xOffset = 0,
    double yOffset = 1000,
    required Widget child,
  }) : this(
          // coverage:ignore-line
          key: key,
          delay: delay,
          duration: duration,
          curve: curve,
          visible: visible,
          xOffset: xOffset,
          yOffset: yOffset,
          child: child,
        );

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: opacity, end: 1.0), duration, curve)
      ..add("scale", Tween(begin: scale, end: 1.0), duration, curve)
      ..add("xOffset", Tween(begin: xOffset, end: 0.0), duration, curve)
      ..add("yOffset", Tween(begin: yOffset, end: 0.0), duration, curve)
      ..add("angle", Tween(begin: angle, end: 0.0), duration, curve);
    return CustomAnimation<MultiTweenValues<String>>(
      control: visible
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      delay: delay,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Transform.scale(
        scale: value.get("scale"),
        child: Opacity(
          opacity: value.get("opacity"),
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
