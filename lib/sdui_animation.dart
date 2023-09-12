import 'package:flutter/material.dart';
import 'dart:math' as math;

// TODO: UPDATE THE NAMES OF THIS ENUM
/// Enum that holds the identifiers for our supported animations
enum AnimationType {
  crossFade,
  opacity,
  align,
  positioned,
  hero,
  size,
  builder,
  container,
  //fade,
  scale,

  slide,
  fadeIn,
  fadeOut
}


enum AnimationDirection {
  bottomToTop,
  topToBottom,
  leftToRight,
  rightToLeft,
  bottomLeftToCenter,
  topLeftToCenter,
  bottomRightToCenter,
  topRightToCenter,

  centerToLeft,
  centerToRight
}

/// Custom Widget to handle animations based on the `animationType` property.
class SDUIAnimation extends StatelessWidget {

  /// TODO: UPDATE THIS
  final AnimationDirection? direction;
  final double? intervalStart;
  final double? intervalEnd;

  /// Experimental
  final AnimationController? animationController;
  final Offset? begin;
  final Offset? end;

  final double? start;
  final double? finish;

  /// Apply to any animation
  final AnimationType animationType;

  /// Applies to some of the animations
  final Duration? duration;
  final Curve? curve;

  /// For 'CrossFade' animations
  final Widget? child;
  final Widget? secondChild;

  /// For 'Opacity' animations
  final double? opacityLevel;

  /// For 'Alignment' animations
  final AlignmentGeometry? alignment;

  /// For `AnimatedPositioned` animations
  final double? width;
  final double? height;
  final double? top;

  /// For 'Hero' animations
  final String? tag;

  /// For `Container' animation
  final Color? color;

  /// Use this to determine the state
  final bool? shouldWelcomeGuest;

  final Animation<double>? fadeTransitionOpacity;

  // TODO: Update to use a dictionary of properties so they can be dynamically driven from content
  //final Map<String, Object> animationProperties;

  const SDUIAnimation({
    super.key,
    required this.animationType,
    this.duration,
    this.child,
    this.secondChild,
    this.shouldWelcomeGuest,
    this.opacityLevel,
    this.alignment,
    this.height,
    this.top,
    this.curve,
    this.width,
    this.tag,
    this.color,
    this.fadeTransitionOpacity,
    this.animationController,
    this.begin,
    this.end,
    this.start,
    this.finish,


    this.direction,
    this.intervalStart,
    this.intervalEnd,
  });

  @override
  Widget build(BuildContext context) {

    Tween<Offset> _getPositionFor(AnimationDirection direction) {
      switch(direction) {
        case AnimationDirection.bottomToTop: {
          return Tween(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.topToBottom: {
          return Tween(
              begin: const Offset(0.0, -1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.leftToRight: {
          return Tween(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.rightToLeft: {
          return Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.bottomLeftToCenter: {
          return Tween(
              begin: const Offset(-1.0, 1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.topLeftToCenter: {
          return Tween(
              begin: const Offset(-1.0, -1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.bottomRightToCenter: {
          return Tween(
              begin: const Offset(1.0, 1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.topRightToCenter: {
          return Tween(
              begin: const Offset(1.0, -1.0),
              end: Offset.zero
          );
        }

        case AnimationDirection.centerToLeft: {
          return Tween(
              begin: Offset.zero,
              end: const Offset(-1.0, 0.0)
          );
        }

        case AnimationDirection.centerToRight: {
          return Tween(
              begin: Offset.zero,
              end: const Offset(1.0, 0.0)
          );
        }

        default: {
          return Tween(
              begin: Offset.zero,
              end: Offset.zero
          );
        }
      }
    }

    switch(animationType) {
      case AnimationType.crossFade: {
        return AnimatedCrossFade(
            firstChild: child ?? context.widget,
            secondChild: secondChild ?? context.widget,
            crossFadeState: shouldWelcomeGuest! ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: duration ?? const Duration(seconds: 0));
      }

      case AnimationType.opacity: {
        return AnimatedOpacity(
            opacity: opacityLevel ?? 0,
            curve: Curves.easeOut,
            duration: duration ?? const Duration(seconds: 0),
            child: child);
      }

      ///---------------------------------------------------------------------------

      case AnimationType.fadeIn: {
        return FadeTransition(
          opacity: Tween(
              begin: 0.0,
              end: 1.0).animate(
              CurvedAnimation(
                  parent: animationController!,
                  curve: Interval(intervalStart ?? 0.0, intervalEnd ?? 1.0))
          ),
          child: child,
        );
      }

      case AnimationType.fadeOut: {
        return FadeTransition(
          opacity: Tween(
              begin: 1.0,
              end: 0.0).animate(
              CurvedAnimation(
                  parent: animationController!,
                  curve: Interval(intervalStart ?? 0.0, intervalEnd ?? 1.0))
          ),
          child: child,
        );
      }

      case AnimationType.slide: {
        return SlideTransition(
          position: _getPositionFor(
              direction ?? AnimationDirection.topToBottom
          ).animate(
              CurvedAnimation(
                  parent: animationController!,
                  curve: Interval(intervalStart ?? 0.0, intervalEnd ?? 1.0)
              )
          ),
          child: child,
        );
      }

      case AnimationType.hero: {
        return Hero(
            tag: tag ?? 'default',
            child: child ?? const Text('DEFAULT')
        );
      }
    ///---------------------------------------------------------------------------


      case AnimationType.scale: {
        return ScaleTransition(
          scale: Tween(
              begin: 0.0,
              end: 1.0
            ).animate(
              CurvedAnimation(
                  parent: animationController!,
                  curve: Interval(intervalStart ?? 0.0, intervalEnd ?? 1.0, curve: curve ?? Curves.elasticOut))
          ),
          child: child,
        );
      }

      case AnimationType.align: {
        return AnimatedAlign(
          alignment: alignment ?? Alignment.bottomRight,
          duration: duration ?? const Duration(seconds: 0),
          child: child);
      }
      
      case AnimationType.positioned: {
        return AnimatedPositioned(
          width: width,
          height: height,
          top: top,
          duration: duration ?? const Duration(seconds: 0),
          curve: curve ?? Curves.bounceIn,
          child: child ?? const Text('DEFAULT'),
        );
      }

      case AnimationType.size: {
        return AnimatedSize(
          duration: duration ?? const Duration(seconds: 0),
          curve: curve ?? Curves.ease,
          child: child);
      }

      case AnimationType.builder: {
        return const SDUIAnimatedBuilder();
      }

      case AnimationType.container: {
        return AnimatedContainer(
          duration: duration ?? const Duration(seconds: 0),
          width: width,
          height: height,
          color: color,
          alignment: alignment,
          curve: curve ?? Curves.bounceOut,
          child: child,
        );
      }

      default: {
        //TODO: IF NO ANIMATION SUPPORTED JUST RETURN THE CHILD
        //return child ?? context.widget;
        const errorMessage = ' ANIMATION NOT SUPPORTED YET';
        return Text(
          animationType.toString() + errorMessage,
        );
      }
    }
  }
}





class SDUIAnimatedBuilder extends StatefulWidget {
  final Widget? child;

  const SDUIAnimatedBuilder({
    super.key,
    this.child
  });

  @override
  State<SDUIAnimatedBuilder> createState() => _SDUIAnimatedBuilderState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _SDUIAnimatedBuilderState extends State<SDUIAnimatedBuilder>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.green,
        child: const Center(
          child: Text('Animated Builder'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}
