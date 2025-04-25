import 'package:flutter/material.dart';
import 'package:portafolio_web/fisicas/mousescroll.dart';
import 'presentation/pages/home_page.dart';
import 'core/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}