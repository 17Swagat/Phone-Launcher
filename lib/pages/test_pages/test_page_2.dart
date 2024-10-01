import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage2 extends StatefulWidget {
  // installed_apps_info: ['name', 'icon', 'buildWith']
  final List<Map<String, dynamic>> installed_apps_info;
  const TestPage2({
    super.key,
    required this.installed_apps_info,
  });

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('TEST PAGE 2'),
        //   backgroundColor: Colors.transparent,
        // ),
        body: Stack(
          children: [
            Image.asset(
              // 'assets/images/background_2.jpg',
              'assets/images/small_size/background_2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            ListView.builder(
              itemCount: 23,
              itemBuilder: (context, index) {
                String app_name = widget.installed_apps_info[index]['name'];
                Uint8List app_icon = widget.installed_apps_info[index]['icon'];

                // return Container(
                //   margin: EdgeInsets.all(15),
                //   height: 32,
                //   width: 32,
                //   child: Center(
                //     child: Row(
                //       children: [
                //         Image.memory(app_icon),
                //         SizedBox(
                //           width: 20,
                //         ),
                //         Text(
                //           overflow: TextOverflow.ellipsis,
                //           '$app_name',
                //           style: GoogleFonts.protestGuerrilla(
                //               fontSize: 18,
                //               letterSpacing: 2,
                //               color: const Color.fromARGB(255, 248, 241, 241),
                //               fontWeight: FontWeight.bold),
                //         )
                //       ],
                //     ),
                //   ),
                // );
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: Image.memory(app_icon),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          app_name,
                          style: GoogleFonts.protestGuerrilla(
                            fontSize: 18,
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        )
        // body:
        );
  }
}
