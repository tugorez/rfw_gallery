import 'package:flutter/material.dart';
import 'package:rfw_gallery/screens/home_screen.dart';
import 'package:rfw_gallery/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}
