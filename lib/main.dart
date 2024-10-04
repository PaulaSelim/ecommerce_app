// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/cart.dart';
import 'pages/intro_page.dart';
import 'utils/scroll_behavior.dart'; // Import the custom scroll behavior

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    );
  }
}
