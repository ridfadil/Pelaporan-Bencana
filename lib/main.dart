import 'package:flutter/material.dart';
import 'package:pelaporan_apps/theme.dart';
import 'package:pelaporan_apps/views/pages/SplashScreen.dart';
import 'package:pelaporan_apps/views/pages/login.dart';
import 'package:pelaporan_apps/views/pages/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelaporan Bencana',
      theme: AppsTheme.nindyaTheme,
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginUser(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
