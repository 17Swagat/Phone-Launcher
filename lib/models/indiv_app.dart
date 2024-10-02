import 'dart:typed_data';
import 'package:installed_apps/app_info.dart';

class InstalledAppModel {
  final String appName;            // = _found_apps[index]['name'];
  final String appVersionName;     // = _found_apps[index]['versionName'];
  final String appPackageName;     // = _found_apps[index]['packageName'];
  final BuiltWith appBuiltWith;    // = _found_apps[index]['builtWith'];
  final Uint8List? appIcon;        // = _found_apps[index]['icon'];
  final String
      appInstalledTimestamp;    // = _found_apps[index]['installedTimeStamp'];
  final String appVersionCode; // = _found_apps[index]['versionCode'];

  InstalledAppModel({
    required this.appName,
    required this.appVersionName,
    required this.appPackageName,
    required this.appBuiltWith,
    required this.appIcon,
    required this.appInstalledTimestamp,
    required this.appVersionCode,
  });
}
