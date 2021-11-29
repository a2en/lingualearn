import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lingualearn/data/constants/app_constants.dart';
import 'package:lingualearn/ui/views/splash.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
