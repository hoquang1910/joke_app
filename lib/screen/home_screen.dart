import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/routes/app_routes.dart';
import 'package:joker/widget/center_joke.dart';
import 'package:joker/widget/footer.dart';
import 'package:joker/widget/header.dart';

class HomeScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: AppRoutes.homeScreen),
    );
  }

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height * 1.2,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                CenterJoke(),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
