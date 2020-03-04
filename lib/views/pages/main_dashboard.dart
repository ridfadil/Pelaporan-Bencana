
import 'package:flutter/material.dart';
import 'package:pelaporan_apps/utils/values/colors.dart';
import 'package:pelaporan_apps/views/navigation/menu_page.dart';
import 'package:pelaporan_apps/views/pages/dashboard.dart';
import 'package:provider/provider.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => new _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> with TickerProviderStateMixin {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: Dashboard(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => Container(
              color: MyColor.bgColorNindya,
              child: Container(
                color: MyColor.bgColorNindya,
              ),
            )),
      ),
    );
  }
}
