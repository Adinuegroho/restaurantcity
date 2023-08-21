import 'package:flutter/material.dart';
import 'package:restaurantcity/model/restaurant.dart';
import 'package:restaurantcity/ui/detail_screen.dart';
import 'package:restaurantcity/ui/home_screen.dart';
import 'package:restaurantcity/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            resto: ModalRoute.of(context)?.settings.arguments as Restaurant,
        )
      },
    );
  }
}

