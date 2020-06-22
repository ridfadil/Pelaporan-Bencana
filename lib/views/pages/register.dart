import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pelaporan_apps/data/api_service.dart';
import 'package:pelaporan_apps/session/constants.dart';
import 'package:pelaporan_apps/utils/components/custom_clipper.dart';
import 'package:pelaporan_apps/utils/helper/CommonUtils.dart';
import 'package:pelaporan_apps/utils/helper/DialogUtils.dart';
import 'package:pelaporan_apps/utils/values/colors.dart';
import 'package:pelaporan_apps/views/pages/dashboard.dart';
import 'package:pelaporan_apps/views/pages/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  bool isValidate;
  TextEditingController nama = new TextEditingController();
  TextEditingController noTelp = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    isValidate = false;
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    nama.dispose();
    noTelp.dispose();
    alamat.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  Future _doLogin() async {
    /*MyDialog.loading(context,"sedang login...");
    Response response = await ApiService.login(
        context: context, email: _email.text, password: password.text);
    MyDialog.dismiss(context);
    return new Future.delayed(new Duration(milliseconds: 0), () {
      if (response.statusCode == APIResponseCode.SUCCESS) {
        var res = new Map<String, dynamic>.from(response.data);
        print(res);
        LoginResponse token = LoginResponse.fromJson(res);
        _setSession(token);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => DashboardDrawer()));
      } else {
        Fluttertoast.showToast(
            msg: response.statusCode.toString() + " - " + response.toString(),
            toastLength: Toast.LENGTH_SHORT);
        return null;
      }
    });*/
  }

  /*void _setSession(LoginResponse token) {
    Session.setToken(token.results.accessToken);
    Session.setRole(token.results.roles);
    Session.setLoggedIn(true);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: buildLogo()),
                            radius: 50.0,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Registrasi User",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [ MyColor.badgeColor, Colors.blue])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                //onChanged: (String value){},
                controller: nama,
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Nama",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: noTelp,
                keyboardType: TextInputType.number,
                //obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "No telp",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.phone,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: alamat,
                //obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Alamat",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.location_on,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ), Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: email,
                //obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ), Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: password,
                obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.lock_outline,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ), Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: confirmPassword,
                obscureText: true,
                //onChanged: (String value){},
                cursorColor: Colors.lightBlue,
                decoration: InputDecoration(
                    hintText: "Konfirmasi Password",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.email,
                        color: MyColor.badgeColor,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: MyColor.badgeColor),
                child: FlatButton(
                  child: Text(
                    "Registrasi",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    ApiService.checkConnection().then((con) {
                      con ? _postDataRegister(context) : CommonUtils.showToast(
                          "Anda Tidak memiliki Koneksi Internet!");
                    });
                    /*setState(() {
                      isValidate = true;
                      if(_email.text.isNotEmpty && password.text.isNotEmpty) {
                        ApiService.checkConnection().then((con) {
                          con? */ /*_doLogin()*/ /* auth_bloc.postLogin(context) : CommonUtils.showFloatingFlushbar(context, "No Internet","Silakan aktifkan internet anda");
                        });
                      }
                    });*/
                  },
                ),
              )),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              child: Text("Login", style: TextStyle(color: MyColor.badgeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginUser()));
              },
            ),
          ),
          SizedBox(height: 40,),
          /*Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an Account ? ", style: TextStyle(color:Colors.black,fontSize: 12 ,fontWeight: FontWeight.normal),),
              Text("Sign Up ", style: TextStyle(color:Colors.red, fontWeight: FontWeight.w500,fontSize: 12, decoration: TextDecoration.underline )),
            ],
          )*/
        ],
      ),
    );
  }

  _postDataRegister(BuildContext context) async {
    if (nama.text.isEmpty) {
      CommonUtils.showToast("Nama Belum diisi");
    } else if (noTelp.text.isEmpty) {
      CommonUtils.showToast("No Telp Belum diisi");
    } else if (email.text.isEmpty || !email.text.contains("@")|| !email.text.contains(".")) {
      CommonUtils.showToast("Email Belum diisi / Format email tidak sesuai");
    } else if (alamat.text.isEmpty) {
      CommonUtils.showToast("Alamat Belum diisi");
    } else if (password.text.isEmpty) {
      CommonUtils.showToast("Password Belum diisi");
    } else if (password.text.isEmpty) {
      CommonUtils.showToast("Password Belum diisi");
    } else if (confirmPassword.text.isEmpty) {
      CommonUtils.showToast("Konfirmasi Password Belum diisi");
    } else  {
      if (password.text.toString() == confirmPassword.text.toString()) {
        MyDialog.loading(context, "Sedang Register");

        bool isThere = false;

        /*await Firestore.instance
            .collection('user')
            //.where('${FirebaseKeys.FB_USER_EMAIL}', isEqualTo: email.text.toString())
            .snapshots()
            .listen((data) {
              for(int i = 0 ; i< data.documents.length;i++){
                if(data.documents[i].data["${FirebaseKeys.FB_USER_EMAIL}"] == email.text.toString()){
                  isThere = true;
                  CommonUtils.showToast("$isThere");
                }
              }
          });
        */
        await Firestore.instance
            .collection('user')
            .getDocuments()
            .then((snapshot) {
          for(int i = 0 ; i< snapshot.documents.length;i++){
            if(snapshot.documents[i].data["${FirebaseKeys.FB_USER_EMAIL}"] == email.text.toString()){
              isThere = true;
              //CommonUtils.showToast("$isThere");
            }
          }
        });

        if(!isThere){
          await Firestore.instance.collection('user').document().setData({
            '${FirebaseKeys.FB_USER_NAMA}': '${nama.text.toString()}',
            '${FirebaseKeys.FB_USER_ALAMAT}': '${alamat.text.toString()}',
            '${FirebaseKeys.FB_USER_EMAIL}': '${email.text.toString()}',
            '${FirebaseKeys.FB_USER_NO_TELP}': '${noTelp.text.toString()}',
            '${FirebaseKeys.FB_USER_PASSWORD}': '${password.text.toString()}',
            '${FirebaseKeys.FB_USER_ROLE}': '0',
          });
          CommonUtils.showToast("Berhasil register");
          MyDialog.dismiss(context);
          Navigator.pop(context);
        }else{
          isThere = false;
          CommonUtils.showToast("Email sudah terdaftar, silakan gunakan alamat email yang lain");
          //MyDialog.dismiss(context);
        }
      } else {
        CommonUtils.showToast("Konfirmasi Password Tidak sesuai!");
      }
    }
  }

  Hero buildLogo() {
    return new Hero(
        tag: "Logo",
        child: Container(
            child: Image.asset("assets/images/logo_pelaporan.png"),));
  }
}
