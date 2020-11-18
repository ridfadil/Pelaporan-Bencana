import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pelaporan_apps/session/constants.dart';
import 'package:pelaporan_apps/session/session.dart';
import 'package:pelaporan_apps/utils/helper/CommonUtils.dart';
import 'package:pelaporan_apps/utils/helper/DialogUtils.dart';
import 'package:pelaporan_apps/utils/helper/utility.dart';

class CreateAccidentReport extends StatefulWidget {
  @override
  _CreateAccidentReportState createState() => _CreateAccidentReportState();
}

class _CreateAccidentReportState extends State<CreateAccidentReport> {

  var dateFormat = new DateFormat("dd-MM-yyyy");
  var timeFormat = new DateFormat("kk:mm");

  TextEditingController date = new TextEditingController();
  TextEditingController time = new TextEditingController();
  TextEditingController lokasi = new TextEditingController();
  TextEditingController uraian = new TextEditingController();
  TextEditingController jenisKecelakaan = new TextEditingController();

  TextEditingController nama = new TextEditingController();
  TextEditingController nik = new TextEditingController();
  TextEditingController alamat = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController telp = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController role = new TextEditingController();
  String dokumenId ="";

  String jenis;
  String userID;
  String periode;

  File _allFile;
  File _CameraFile;
  List<File> listDokumen = new List<File>();

  var _jenisLaporanKecelakaan = [
    "Gempa Bumi",
    "Erupsi Gunung",
    "Tsunami",
    "Tanah Longsor",
    "Banjir",
    "Kekeringan",
    "Puting Beliung",
    "Abrasi",
    "Kebakaran",
  ];

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buat Laporan Bencana",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 60),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text("Rincian Pelapor"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              buildTextField("Nama Pelapor",nama,isDisable: false),
              SizedBox(
                height: 10,
              ),

              buildTextField("NIK Pelapor",nik,isDisable: false),
              SizedBox(
                height: 10,
              ),
              buildTextField("No Handphone Pelapor",telp,isDisable: false),
              SizedBox(
                height: 10,
              ),
              buildTextField("Alamat Pelapor",alamat,isDisable: false),
              SizedBox(
                height: 10,
              ),
              buildTextField("Email Pelapor",email,isDisable: false),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text("Rincian Laporan"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              buildDateField("Tanggal Bencana"),
              SizedBox(
                height: 10,
              ),
              buildTimeField("Waktu Bencana"),
              SizedBox(
                height: 10,
              ),
              buildDropDownPerubahanField("Jenis Bencana"),
              SizedBox(
                height: 10,
              ),
              buildTextField("Lokasi/Alamat Bencana",lokasi),
              SizedBox(
                height: 10,
              ),
              buildTextField("Uraian Bencana",uraian),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.folder,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      tooltip: 'Attach File Bencana',
                      onPressed: () {
                        listDokumen.length == 0? getAllFile() : CommonUtils.showToast("Lampiran foto sudah ada");
                      },
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      tooltip: 'Attach File From Camera',
                      onPressed: () {
                        listDokumen.length == 0? getCameraFile() : CommonUtils.showToast("Lampiran foto sudah ada");
                      },
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: listDokumen.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  String nameFile = path.basename(listDokumen[index].path);
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      Image.file(
                                          listDokumen[index],
                                        width: 150,
                                        height: 150,
                                      ),
                                      Text("${nameFile}"),
                                    ],
                                  )),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    listDokumen.removeAt(index);
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _postLaporan(context);
          /*CommonUtils.showToast("Berhasil Melaporkan Kecelakaan");
          Navigator.pop(context);*/
        },
        label: Text('Laporkan !'),
        icon: Icon(Icons.save),
        backgroundColor:Colors.red,
      ),
    );
  }

  _postLaporan(BuildContext context) async {
    if (date.text.isEmpty) {
      CommonUtils.showToast("Tanggal Bencana Belum diisi");
    } else if (time.text.isEmpty) {
      CommonUtils.showToast("Waktu Bencana Belum diisi");
    } else if (jenis =="") {
      CommonUtils.showToast("Jenis Bencana Belum diisi");
    }else if (lokasi.text.isEmpty) {
      CommonUtils.showToast("Lokasi Bencana Belum diisi");
    }else if (uraian.text.isEmpty) {
      CommonUtils.showToast("Uraian Bencana Belum diisi");
    }else if (listDokumen.length==0) {
      CommonUtils.showToast("Lampiran dokumen harus diisi");
    } else {
      MyDialog.loading(context, "Membuat laporan");
      Uint8List bytes = listDokumen[0].readAsBytesSync();
      String fileHex = Utility.base64String(bytes);
      await Firestore.instance.collection('report').document().setData({
        '${FirebaseKeys.FB_USER_NAMA}': '${nama.text.toString()}',
        '${FirebaseKeys.FB_USER_NIK}': '${nik.text.toString()}',
        '${FirebaseKeys.FB_USER_ALAMAT}': '${alamat.text.toString()}',
        '${FirebaseKeys.FB_USER_EMAIL}': '${email.text.toString()}',
        '${FirebaseKeys.FB_USER_NO_TELP}': '${telp.text.toString()}',

        '${FirebaseKeys.FB_REPORT_ID_USER}': '$dokumenId',
        '${FirebaseKeys.FB_REPORT_DATE_KECELAKAAN}': '${date.text.toString()}',
        '${FirebaseKeys.FB_REPORT_JENIS_KECELAKAAN}': '$jenis',
        '${FirebaseKeys.FB_REPORT_LOKASI_KECELAKAAN}': '${lokasi.text.toString()}',
        '${FirebaseKeys.FB_REPORT_TIME_KECELAKAAN}': '${time.text.toString()}',
        '${FirebaseKeys.FB_REPORT_URAIAN_KECELAKAAN}': '${uraian.text.toString()}',
        '${FirebaseKeys.FB_REPORT_FILE_KECELAKAAN}': '$fileHex',
      });
      MyDialog.dismiss(context);
      Navigator.pop(context);
      CommonUtils.showToast("Berhasil Melaporkan Bencana!");
    }
  }

  Future getProfile() async {
    userID = await Session.getUserId();
    Firestore.instance
        .collection('user')
        .document('$userID')
        .get()
        .then((DocumentSnapshot ds) {
      setState(() {
        nama.text = ds.data['nama'];
        nik.text = ds.data['nik'];
        email.text = ds.data['email'];
        telp.text = ds.data['telp'];
        alamat.text = ds.data['alamat'];
        password.text = ds.data['password'];
        role.text = ds.data['role'];
        dokumenId = ds.documentID;
      });
    });
  }

  Future getAllFile() async {
    var files = await FilePicker.getFile(type: FileType.any);
    if (files != null) {
      setState(() {
        _allFile = files;
        listDokumen.add(_allFile);
      });
    } else {
      CommonUtils.showToast("Files tidak boleh kosong");
    }
  }

  Future getCameraFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _CameraFile = image;
        listDokumen.add(_CameraFile);
      });
    } else {
      CommonUtils.showToast("Files tidak boleh kosong");
    }
  }

  Widget buildTextField(String title,TextEditingController controller,{bool isDisable=true}) => Container(
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      controller: controller,
      maxLines: null,
      maxLength: null,
      enabled: isDisable,
      decoration: new InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        /*suffixIcon: IconButton(
                            icon: Icon(Icons.search,color: Colors.redAccent,),
                            onPressed: () {}
                        ),*/
        //fillColor: Colors.green
      ),
    ),
  );

  Widget buildDropDownPerubahanField(String title)=> FormField<String>(
    builder: (FormFieldState<String> state) {
      return InputDecorator(
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black, fontSize: 16.0),
            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            hintText: title,
            labelText: title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        isEmpty: jenis == '',
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: jenis,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                jenis = newValue;
                state.didChange(newValue);
              });
            },
            items: _jenisLaporanKecelakaan.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      );
    },
  );

  Widget buildDateField(String title) => Container(
    child: DateTimeField(
      controller: date,
      format: dateFormat,
      readOnly: true,
      decoration: new InputDecoration(
        labelText: title,
        //hintText: "Masukan Keyword",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        suffixIcon: IconButton(
            icon: Icon(Icons.date_range,color: Colors.redAccent,),
            onPressed: () {}),
        //fillColor: Colors.green
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    ),
  );

  Widget buildTimeField(String title) => Container(
    child: DateTimeField(
      controller: time,
      format: timeFormat,
      readOnly: true,
      decoration: new InputDecoration(
        labelText: title,
        //hintText: "Masukan Keyword",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        suffixIcon: IconButton(
            icon: Icon(Icons.access_time,color: Colors.redAccent,),
            onPressed: () {}),
      ),
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
    ),
  );
}
