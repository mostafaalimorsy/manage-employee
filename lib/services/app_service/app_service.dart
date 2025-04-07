// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
//
// class AppService {
//   //
//
//   /// Factory method that reuse same instance automatically
//
//   /// Private constructor
//   AppService._() {}
//
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
//   get getContext => navigatorKey.currentState?.context;
//   NavigatorState? get getCurrentState => navigatorKey.currentState;
//
//
//   /// if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
//   // get getContext => navigatorKey.currentContext;
//   Future<T?> pushRoute<T>(
//       String route, {
//         bool isNewTask = false,
//         bool isToReplace = false,
//         String? exceptRoute,
//         Map<String, dynamic>? arguments,
//       }) async {
//     if (isNewTask) {
//       return navigatorKey.currentState!.pushNamedAndRemoveUntil(
//           route, exceptRoute!.isNotEmpty ? ModalRoute.withName(exceptRoute) : (route) => false,
//           arguments: arguments);
//     } else if (isToReplace) {
//       return navigatorKey.currentState!.pushReplacementNamed(route, arguments: arguments);
//     } else {
//       return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
//     }
//   }
//
//   /// Dispose current screens or close current dialog
//
//   void pop([Object? object]) {
//     if (Navigator.canPop(AppService().getContext)) Navigator.pop(AppService().getContext, object);
//   }
//
// }
