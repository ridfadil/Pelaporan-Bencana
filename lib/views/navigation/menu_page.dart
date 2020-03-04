
import 'package:flutter/material.dart';
import 'package:pelaporan_apps/utils/components/circular_image.dart';
import 'package:pelaporan_apps/utils/values/colors.dart';
import 'package:pelaporan_apps/utils/values/dimens.dart';
import 'package:pelaporan_apps/views/pages/dashboard.dart';
import 'package:pelaporan_apps/views/pages/main_dashboard.dart';
import 'package:pelaporan_apps/views/pages/pelaporan_bencana.dart';
import 'package:pelaporan_apps/views/pages/pelaporan_kecelakaan.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://cdn0-production-images-kly.akamaized.net/KpspM3HxCDgOtX0pcaPnoqzygB8=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2377758/original/095608400_1538997092-Aliando_1.jpg";
  static BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return SingleChildScrollView(
      child: GestureDetector(
        onPanUpdate: (details) {
          //on swiping left
          if (details.delta.dx < -6) {
            Provider.of<MenuController>(context, listen: true).toggle();
          }
        },
        child: Container(
          padding: EdgeInsets.only(
              top: 62,
              left: 32,
              bottom: 8,
              right: MediaQuery.of(context).size.width / 2.9),
          color: MyColor.colorNavbarNindya,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircularImage(
                      NetworkImage(imageUrl),
                    ),
                  ),
                  Text(
                    'Fadil',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  // color: Colors.grey[300],
                  child: ListTile(
                    leading: Icon(
                      Icons.dashboard,
                      color: MyColor.colorOrangeNindya,
                      size: 20,
                    ),
                    title: Text('Dashboard',
                        style: TextStyle(
                            fontSize: MyDimens.textSizeVerySmall,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainDashboard())),
                  )),
              Container(
                  //margin: EdgeInsets.only(top: 20),
                  // color: Colors.grey[300],
                  child: ListTile(
                    leading: Icon(
                      Icons.video_library,
                      color: MyColor.colorOrangeNindya,
                      size: 20,
                    ),
                    title: Text('Pelaporan Bencana',
                        style: TextStyle(
                            fontSize: MyDimens.textSizeVerySmall,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    //onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => NindyaTube())),
                    onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => PelaporanBencana())),
                  )),
              Container(
                  //margin: EdgeInsets.only(top: 20),
                  // color: Colors.grey[300],
                  child: ListTile(
                    leading: Icon(
                      Icons.web,
                      color: MyColor.colorOrangeNindya,
                      size: 20,
                    ),
                    title: Text('Pelaporan Kecelakaan',
                        style: TextStyle(
                            fontSize: MyDimens.textSizeVerySmall,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => PelaporanKecelakaan())),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;
  MaterialPageRoute materialPageRoute;

  MenuItem(this.icon, this.title, this.materialPageRoute);
}
