import 'package:flutter/material.dart';
import 'package:rfw_gallery/screens/app_bar_screen.dart';
import 'package:rfw_gallery/screens/animations_screen.dart';
import 'package:rfw_gallery/screens/home_screen.dart';
import 'package:rfw_gallery/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => HomeScreen(),
        '/AppBar': (context) => const AppBarScreen(),
        '/Animations': (context) => const AnimationsScreen(),
      },
    );
  }
}
