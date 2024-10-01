// #1

import 'package:app_minimalist_launcher/components/textfield_design_01.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

// import 'package:device_apps/device_apps.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List deviceInstalledAppsInfo = [];

  Future<void> getInstalledAppsInfo() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");

    for (AppInfo a in apps) {
      // print('\n${a.name}, ${a.icon}, ${a.builtWith}\n');
      deviceInstalledAppsInfo.add({
        'name': a.name,
        'icon': a.icon,
        'builtWith': a.builtWith,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getInstalledAppsInfo();
  }

  TextEditingController searchController = TextEditingController();
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'S K B   C O R P S.',
          textAlign: TextAlign.center,
          style: GoogleFonts.protestGuerrilla(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            // 'assets/images/background_2.jpg',
            'assets/images/small_size/background_2.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // ListView(
          //   children: [
          //     Text(
          //       'SIMPLIFY\nYOUR SCREEN',
          //       style: GoogleFonts.protestGuerrilla(
          //           fontSize: 45, color: Colors.white),
          //     ),
          //     const SizedBox(height: 40),
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //       child: TextField_Design_01(
          //         controller: searchController,
          //         hintText: 'S E A R C H . . .',
          //       ),
          //     ),
          //   ],
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   'SIMPLIFY\nYOUR SCREEN',
                    //   style: GoogleFonts.protestGuerrilla(
                    //       fontSize: 45, color: Colors.white),
                    // ),
                    // const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField_Design_01(
                        controller: searchController,
                        hintText: 'S E A R C H . . .',
                      ),
                    ),
                  ],
                ),
              ),

              // Testing:
              // Container(
              //   height: 100,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: colors.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: 80,
              //         height: 80,
              //         margin: EdgeInsets.all(10),
              //         decoration: BoxDecoration(
              //           color: colors[index],
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // Installed-Apps:
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: deviceInstalledAppsInfo.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          // color: Colors.pink,
                          color: const Color.fromARGB(0, 231, 223, 223),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10,),
                          // padding: EdgeInsets.symmetric(horizontal: 10,),
                          child: ListView(
                            children: [
                              Image.memory(
                                deviceInstalledAppsInfo[index]['icon'],
                              ),
                              Text('${deviceInstalledAppsInfo[index]['name']}',
                              style: GoogleFonts.protestGuerrilla(
                                fontSize: 18,
                                color: Colors.white
                              ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),

              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     // height: 100,
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: deviceInstalledAppsInfo.length,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           width: 80,
              //           height: 80,
              //           margin: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //             color: const Color.fromARGB(
              //                 255, 230, 209, 207), //colors[index],
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           child: Container(
              //             margin: EdgeInsets.only(bottom: 20),
              //             child: Center(
              //                 child: Column(
              //               children: [
              //                 Image.memory(
              //                   deviceInstalledAppsInfo[index]['icon'],
              //                 ),
              //                 Text('${deviceInstalledAppsInfo[index]['name']}'),
              //               ],
              //             )),
              //           ), //Icon(deviceInstalledAppsInfo[index]['icon']),
              //           // child: Text('1'),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
