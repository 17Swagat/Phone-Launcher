// TODO: "Background-Image: Cache"

import 'package:app_minimalist_launcher/models/indiv_app.dart';
import 'package:app_minimalist_launcher/pages/test_pages/test_page_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    List<Map<String, dynamic>> deviceInstalledAppsInfo = [];
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");
    // @me:
    List<InstalledAppModel> installed_apps = [];

    for (AppInfo a in apps) {
      deviceInstalledAppsInfo.add({
        'name': a.name, // string
        'versionName': a.versionName, // string
        'packageName': a.packageName, // String
        'builtWith': a.builtWith, // BuiltWith
        'icon': a.icon, // Uint8List?
        'installedTimestamp': a.installedTimestamp, // int
        'versionCode': a.versionCode, // int
      });
    }

    setState(() {
      _isLoading = false;
    });

    // Use Future.microtask to schedule navigation after the current build cycle
    Future.microtask(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => TestPage2(
            installed_apps_info: deviceInstalledAppsInfo,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 5,
              color: Colors.redAccent,
            ),
            SizedBox(height: 20),
            Text(
              'L O A D I N G . . .',
              style: GoogleFonts.protestGuerrilla(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
