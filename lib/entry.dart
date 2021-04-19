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

  /// Default constructor
  Entry(
    { 
      required this.child,
      this.delay = Duration.zero, 
      this.duration = const Duration(milliseconds: 250),
      this.curve = Curves.ease,
      this.opacity = 0,
      this.scale = 0,
      this.xOffset = 0,
      this.yOffset = 150,
    }
  );

  /// Opacity-only constructor
  Entry.alpha({ 
    required Widget child, 
    Duration delay = Duration.zero,
    double opacity = 0
  }) : this(
    child: child,
    delay: delay, 
    yOffset: 0,
    scale: 1,
    opacity: opacity
  );
  
  /// Scale-only constructor
  Entry.scale({ 
    required Widget child, 
    Duration delay = Duration.zero,
    double scale = 0,
  }) : this(
    child: child,
    delay: delay, 
    yOffset: 0,
    opacity: 1,
    scale: scale,
  );

  /// Offset-only constructor
  Entry.offset({ 
    required Widget child, 
    Duration delay = Duration.zero,
    double xOffset = 0,
    double yOffset = 1000,
  }) : this(
    child: child,
    delay: delay, 
    opacity: 1,
    scale: 1,
    xOffset: xOffset,
    yOffset: yOffset,
  );


  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<String>()
      ..add("opacity", Tween(begin: opacity, end: 1.0), duration, curve)
      ..add("scale", Tween(begin: scale, end: 1.0), duration, curve)
      ..add("translateX", Tween(begin: xOffset, end: 0.0), duration, curve)
      ..add("translateY", Tween(begin: yOffset, end: 0.0), duration, curve);
    return PlayAnimation<MultiTweenValues<String>>(
      delay: delay,
      duration: tween.duration,
      curve: Curves.decelerate, // or fastOutSlowIn
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
              child: child
          ),
        ),
      ),
    );
  }
}
