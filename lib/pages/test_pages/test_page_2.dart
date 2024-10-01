// #################################################################
// # 1
// #################################################################
import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
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
          return Container(
            margin: EdgeInsets.all(20),
            height: 32,
            width: 32,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.memory(deviceInstalledAppsInfo[index]['icon']),
                  const SizedBox(width: 10,),
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
