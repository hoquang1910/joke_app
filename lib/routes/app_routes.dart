import 'package:flutter/material.dart';
import 'package:joker/screen/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('error')),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
