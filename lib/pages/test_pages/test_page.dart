// #################################################################
// # 1
// #################################################################

// import 'package:flutter/material.dart';
// import 'package:installed_apps/installed_apps.dart';
// import 'package:installed_apps/app_info.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   List deviceInstalledAppsInfo = [];

//   Future<void> getInstalledAppsInfo() async {
//     List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");

//     for (AppInfo a in apps) {
//       // print('\n${a.name}, ${a.icon}, ${a.builtWith}\n');
//       deviceInstalledAppsInfo.add({
//         'name': a.name,
//         'icon': a.icon,
//         'builtWith': a.builtWith,
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getInstalledAppsInfo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         print(deviceInstalledAppsInfo.length);
//       }),
//       appBar: AppBar(
//         title: const Text('TEST PAGE'),
//       ),

//       // #1
//       // body: ListView.builder(
//       //   scrollDirection: Axis.vertical,
//       //   itemCount: deviceInstalledAppsInfo.length,
//       //   itemBuilder: (context, index) {
//       //     return Container(
//       //       height: 10,
//       //       width: 10,
//       //       decoration: const BoxDecoration(color: Colors.deepPurple),
//       //       child: Column(
//       //         children: [
//       //           Image.memory(deviceInstalledAppsInfo[index]['icon']),
//       //           Text('${deviceInstalledAppsInfo[index]['name']}'),
//       //         ],
//       //       ),
//       //     );
//       //   },

//       // #2
//       // body: ListView.builder(
//       //   itemCount: 100,
//       //   itemBuilder: (context, index) {
//       //     return Text('Hello $index');
//       //   },
//       // ),

//       // #3
//       body: ListView.builder(
//         itemCount: deviceInstalledAppsInfo.length,
//         itemBuilder: (context, index) {
//           var app_name = deviceInstalledAppsInfo[index]['name'];
//           var app_icon = deviceInstalledAppsInfo[index]['icon'];
//           return Container(
//             color: Colors.white30,

//           );
//         },
//       ),
//     );
//   }
// }

// #################################################################
// # 2
// #################################################################
import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List deviceInstalledAppsInfo = [];

  Future<void> getInstalledAppsInfo() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");

    for (AppInfo a in apps) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(deviceInstalledAppsInfo.length);
      }),
      appBar: AppBar(
        title: const Text('TESTx PAGE'),
      ),
      body: ListView.builder(
        itemCount: deviceInstalledAppsInfo.length,
        itemBuilder: (context, index) {
          var appName = deviceInstalledAppsInfo[index]['name'];
          var appIcon = deviceInstalledAppsInfo[index]['icon'];
          // return Container(
          //   margin: const EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: MemoryImage(appIcon),
          //       fit: BoxFit.cover,
          //     ),
          //     borderRadius: BorderRadius.circular(12.0),
          //   ),
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //       color: Colors.black54,
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         appName,
          //         style: const TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 16.0,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // );
          return Container(
            margin: EdgeInsets.all(20),
            height: 32,
            width: 32,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.memory(deviceInstalledAppsInfo[index]['icon']),
                  Text('${deviceInstalledAppsInfo[index]['name']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
