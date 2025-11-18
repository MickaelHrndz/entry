import 'package:entry/tween_property.dart';
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
  final bool visible;

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
  const Entry({
    super.key,
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
  })  : assert(opacity >= 0 && opacity <= 1); // coverage:ignore-line

  /// Constructor making use of every animation by default except [angle] and [xOffset]
  const Entry.all({
    super.key,
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
  }); // coverage:ignore-line

  /// Opacity-only constructor
  const Entry.opacity({
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
  const Entry.scale({
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
  const Entry.offset({
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
    final tween = MovieTween()
      ..tween(TweenProperty.opacity, Tween(begin: opacity, end: 1.0), duration: duration, curve: curve)
      ..tween(TweenProperty.scale, Tween(begin: scale, end: 1.0), duration: duration, curve: curve)
      ..tween(TweenProperty.xOffset, Tween(begin: xOffset, end: 0.0), duration: duration, curve: curve)
      ..tween(TweenProperty.yOffset, Tween(begin: yOffset, end: 0.0), duration: duration, curve: curve)
      ..tween(TweenProperty.angle, Tween(begin: angle, end: 0.0), duration: duration, curve: curve);

    return CustomAnimationBuilder<Movie>(
      control: visible ? Control.play : Control.playReverse,
      delay: delay,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) {
        final o = value.get(TweenProperty.opacity);
        final s = value.get(TweenProperty.scale);
        final dx = value.get(TweenProperty.xOffset);
        final dy = value.get(TweenProperty.yOffset);
        final a = value.get(TweenProperty.angle);

        return Opacity(
          opacity: o,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(s)
              ..translate(dx, dy)
              ..rotateZ(a),
            child: child,
          ),
        );
      },
    );
  }
}
