import 'package:flutter/material.dart';

class TextField_Design_01 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  TextField_Design_01(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 35,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.white, width: 5, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.grey, width: 5, style: BorderStyle.solid),
          )),
    );
  }
}
