import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';


/// Animates its child into a visible state (opacity, scale and offset)
class Entry extends StatelessWidget {

  /// The child to animate
  final Widget child;

  /// The delay before animating
  final Duration delay;

  /// The duration of the animation 
  final Duration duration;

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

  /// Default constructor
  const Entry({ 
    Key? key,
    this.delay = Duration.zero, 
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    this.opacity = 1,
    this.scale = 1,
    this.xOffset = 0,
    this.yOffset = 0,
    this.angle = 0,
    required this.child,
  }) : super(key: key);

  /// Constructor using all animations in full effect, except [angle]
  Entry.all({
    Key? key,
    this.delay = Duration.zero, 
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    this.opacity = 0,
    this.scale = 0,
    this.xOffset = 0,
    this.yOffset = 150,
    this.angle = 0,
    required this.child
  }) : super(key: key);

  /// Opacity-only constructor
  Entry.opacity({
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    double opacity = 0,
    required Widget child
  }) : this(
    key: key,
    delay: delay, 
    duration: duration,
    curve: curve,
    opacity: opacity,
    child: child,
    yOffset: 0,
    scale: 1,
  );
  
  /// Scale-only constructor
  Entry.scale({ 
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    double scale = 0,
    required Widget child
  }) : this(
    key: key,
    delay: delay, 
    duration: duration,
    curve: curve,
    scale: scale,
    child: child,
    yOffset: 0,
    opacity: 1,
  );

  /// Offset-only constructor
  Entry.offset({ 
    Key? key,
    Duration delay = Duration.zero,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
    double xOffset = 0,
    double yOffset = 1000,
    required Widget child
  }) : this(
    key: key,
    delay: delay, 
    duration: duration,
    curve: curve,
    xOffset: xOffset,
    yOffset: yOffset,
    child: child,
    opacity: 1,
    scale: 1,
  );


  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: opacity, end: 1.0), duration, curve)
      ..add("scale", Tween(begin: scale, end: 1.0), duration, curve)
      ..add("translateX", Tween(begin: xOffset, end: 0.0), duration, curve)
      ..add("translateY", Tween(begin: yOffset, end: 0.0), duration, curve)
      ..add("angle", Tween(begin: angle, end: 0.0), duration, curve);
    return PlayAnimation<MultiTweenValues<String>>(
      delay: delay,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.scale(
          scale: value.get("scale"),
          child: Transform.translate(
            offset: Offset(
              value.get("translateX"), 
              value.get("translateY")), 
              child: Transform.rotate(
                angle: value.get("angle"),
                child: child)
          ),
        ),
      ),
    );
  }
}
