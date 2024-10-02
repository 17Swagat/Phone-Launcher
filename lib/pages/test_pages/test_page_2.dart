// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TestPage2 extends StatefulWidget {
//   // installed_apps_info: ['name', 'icon', 'buildWith']
//   final List<Map<String, dynamic>> installed_apps_info;
//   const TestPage2({
//     super.key,
//     required this.installed_apps_info,
//   });

//   @override
//   State<TestPage2> createState() => _TestPage2State();
// }

// class _TestPage2State extends State<TestPage2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text('TEST PAGE 2'),
//         //   backgroundColor: Colors.transparent,
//         // ),
//         body: Stack(
//           children: [
//             Image.asset(
//               // 'assets/images/background_2.jpg',
//               'assets/images/small_size/background_2.jpg',
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             ListView.builder(
//               itemCount: 23,
//               itemBuilder: (context, index) {
//                 String app_name = widget.installed_apps_info[index]['name'];
//                 Uint8List app_icon = widget.installed_apps_info[index]['icon'];

//                 // return Container(
//                 //   margin: EdgeInsets.all(15),
//                 //   height: 32,
//                 //   width: 32,
//                 //   child: Center(
//                 //     child: Row(
//                 //       children: [
//                 //         Image.memory(app_icon),
//                 //         SizedBox(
//                 //           width: 20,
//                 //         ),
//                 //         Text(
//                 //           overflow: TextOverflow.ellipsis,
//                 //           '$app_name',
//                 //           style: GoogleFonts.protestGuerrilla(
//                 //               fontSize: 18,
//                 //               letterSpacing: 2,
//                 //               color: const Color.fromARGB(255, 248, 241, 241),
//                 //               fontWeight: FontWeight.bold),
//                 //         )
//                 //       ],
//                 //     ),
//                 //   ),
//                 // );
//                 return Container(
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 32,
//                         height: 32,
//                         child: Image.memory(app_icon),
//                       ),
//                       SizedBox(width: 20),
//                       Expanded(
//                         child: Text(
//                           app_name,
//                           style: GoogleFonts.protestGuerrilla(
//                             fontSize: 18,
//                             letterSpacing: 2,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         )
//         // body:
//         );
//   }
// }

// #2
// import 'dart:typed_data';
import 'dart:typed_data';

import 'package:app_minimalist_launcher/components/textfield_design_01.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class TestPage2 extends StatefulWidget {
  final List<Map<String, dynamic>> installed_apps_info;
  const TestPage2({
    super.key,
    required this.installed_apps_info,
  });

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> _found_apps = [];
  @override
  void initState() {
    _found_apps = widget.installed_apps_info;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    // List<Map<String, dynamic>> results = [];
    // if (enteredKeyword.isEmpty) {
    //   results = widget.installed_apps_info;
    // } else {
    //   results = widget.installed_apps_info.where(test);  //.where((user)=>user['name']);
    //   // results = widget.installed_apps_info.where((element) {
    //   //   return element['name'].toLowerCase().contains(enteredKeyword.toLowerCase());
    //   // });
    // }
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.installed_apps_info;
    } else {
      results = widget.installed_apps_info.where((app) {
        return app['name'].toLowerCase().contains(enteredKeyword.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/small_size/background_2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  // #1
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search apps...',
                      hintStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.3),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),

                  // #2
                  // child: TextField_Design_01(
                  //   controller: _searchController,
                  //   hintText: 'S E A R C H  A P P S . . .',
                  // ),
                ),
                Expanded(
                  child: ListView.builder(
                    // itemCount: widget.installed_apps_info.length,
                    itemCount: _found_apps.length,
                    itemBuilder: (context, index) {
                      String appName = _found_apps[index]['name'];
                      String appVersionName = _found_apps[index]['versionName'];
                      String appPackageName = _found_apps[index]['packageName'];
                      BuiltWith appBuiltWith = _found_apps[index]['builtWith'];
                      Uint8List? appIcon = _found_apps[index]['icon'];
                      int appInstalledTimestamp =
                          _found_apps[index]['installedTimestamp'];
                      int appVersionCode = _found_apps[index]['versionCode'];

                      return GestureDetector(
                        onTap: () async {
                          // print('clicked!!!');
                          // print('Clicked: $app_name');
                          try {
                            InstalledApps.startApp(appPackageName);
                          } catch (e) {
                            // print(e.toString());
                            // throw Exce
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          child: Row(
                            children: [
                              // SizedBox(
                              //   width: 32,
                              //   height: 32,
                              //   child: Image.memory(appIcon),
                              // ),
                              
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: appIcon != null
                                    ? Image.memory(appIcon)
                                    : const Icon(
                                        Icons.android,
                                        size: 32,
                                      ), // Fallback icon
                              ),
                              
                              const SizedBox(width: 20),
                              
                              Expanded(
                                child: Text(
                                  appName,
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
