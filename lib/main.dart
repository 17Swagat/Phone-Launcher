import 'package:app_minimalist_launcher/pages/home_page.dart';
import 'package:app_minimalist_launcher/pages/loading_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // #2
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingPage(),
  ));
}

  // #1
  // WidgetsFlutterBinding.ensureInitialized(); // Ensure the binding is initialized

  // List<Map<String, dynamic>> deviceInstalledAppsInfo = [];
  // List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");

  // for (AppInfo a in apps) {
  //   deviceInstalledAppsInfo.add({
  //     'name': a.name,
  //     'icon': a.icon,
  //     'builtWith': a.builtWith,
  //   });
  // }

  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: TestPage2(
  //     installed_apps_info: deviceInstalledAppsInfo,
  //   ), //TestPage()//HomePage(),
  // ));
// }
