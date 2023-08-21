import 'package:flutter/material.dart';
import 'loading_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xffE7C6A7),
      body: SafeArea(
        child: LoadingScreen(),
      ),
    ),
  ));
}

