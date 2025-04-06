import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';
import 'package:mostafamorsy/core/app_exports/screens_exports.dart';



enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

class Routes {
  Routes._internal();


  static const String homeRoute = "/home ";
}

class RouteGenerator {
  RouteGenerator._internal();
  PageRouteAnimation? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;

  static Route<dynamic>? getRoute(RouteSettings routeSettings) {
    log("route us: ${routeSettings.name!}");
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return pageFadeTransition(widget: const HomeScreen(), routeSettings: routeSettings);
    }
    return null;
  }

  static Route<T> pageFadeTransition<T>({
    required Widget widget,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration,
    RouteSettings? routeSettings,
  }) {
    pageRouteAnimation = pageRouteAnimation ?? PageRouteAnimation.Scale;
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.Fade) {
        return PageRouteBuilder(
          settings: routeSettings,
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
          reverseTransitionDuration: const Duration(milliseconds: 50),
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection: TextDirection.ltr ,
              child: widget),
          transitionsBuilder: (c, anim, a2, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection:  TextDirection.ltr , child: widget),
          transitionsBuilder: (c, anim, a2, child) {
            return RotationTransition(child: child, turns: ReverseAnimation(anim));
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection:  TextDirection.ltr, child: widget),
          transitionsBuilder: (c, anim, a2, child) {
            return ScaleTransition(child: child, scale: anim);
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection:  TextDirection.ltr , child: widget),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, a1, a2) => Directionality(
              textDirection:  TextDirection.ltr , child: widget),
          transitionsBuilder: (c, anim, a2, child) {
            return SlideTransition(
              child: child,
              position: Tween(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(anim),
            );
          },
          transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
        );
      }
    }
    return MaterialPageRoute<T>(
      builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          child: Directionality(
              textDirection:  TextDirection.ltr , child: widget)),
      settings: routeSettings,
    );
  }
// static pageFadeTransition(
//         {required Widget widget, RouteSettings? routeSettings}) =>
//     PageRouteBuilder(
//       settings: routeSettings,
//       transitionDuration: const Duration(milliseconds: 100),
//       reverseTransitionDuration: const Duration(milliseconds: 50),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         Animation<double> opacity = animation.drive(
//             Tween(begin: 0.0, end: 1.0)
//               ..chain(CurveTween(curve: Curves.linearToEaseOut)));
//         return FadeTransition(
//           opacity: opacity,
//           child: Directionality(
//             textDirection: context.read<LanguageCubit>().isEn
//                 ? TextDirection.ltr
//                 : TextDirection.rtl,
//
//             child: child,
//           ),
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) => widget,
//     );
// static pageBottomLeftToTopRightTransition(
//         {required Widget widget, required RouteSettings routeSettings}) =>
//     PageRouteBuilder(
//       transitionDuration: const Duration(seconds: 1),
//       reverseTransitionDuration: const Duration(seconds: 1),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         Animation<Offset> position = animation.drive(
//             Tween(begin: const Offset(-0.5, 1), end: const Offset(0, 0))
//               ..chain(CurveTween(curve: Curves.linearToEaseOut)));
//         return SlideTransition(
//           position: position,
//           child: child,
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) => widget,
//     );
}
