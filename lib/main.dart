import 'package:app_minimalist_launcher/pages/home_page.dart';
import 'package:app_minimalist_launcher/pages/test_pages/test_page.dart';
import 'package:app_minimalist_launcher/pages/test_pages/test_page_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TestPage2(),//TestPage()//HomePage(),
  ));
}
