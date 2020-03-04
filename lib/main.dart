import 'package:flutter/material.dart';
import 'package:pelaporan_apps/theme.dart';
import 'package:pelaporan_apps/views/pages/SplashScreen.dart';
import 'package:pelaporan_apps/views/pages/login.dart';
import 'package:pelaporan_apps/views/pages/main_dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DWS Nindya Karya',
      theme: AppsTheme.nindyaTheme,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginUser(),
        '/dashboard': (context) => MainDashboard(),
      },
    );
  }
}
