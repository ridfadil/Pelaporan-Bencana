import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

Map<String, String> params = {};
Map<String, String> body = {};
Response response;
FormData formData;
Dio dio;

class ApiService {
  static String BASE_URL = "http://rept-management.pragmadev.us/api";
  static String BASE_URL_DOWNLOAD = "rept-management.pragmadev.us";

  /////////////////////// Settings Dio /////////////////////////////
  /*static _dioSetting(bool isHeader) async {
    dio = new Dio();
    dio.options.baseUrl = BASE_URL;
    dio.options.connectTimeout = 9000; //5s
    dio.options.receiveTimeout = 3000;
    if (isHeader) dio.options.headers = await getHeaders();
    return dio;
  }*/

  //Tambah Kalau Ada Headers disini
  /*static getHeaders() async {
    Map<String, String> header = {};
    header.clear();
    String token = await Session.getToken();
    header = {
      "Authorization": "Bearer " + token,
      "Accept": "application/json",
    };
    print("HEADERSS: " + header.toString());
    return header;
  }*/

  /////////////////////// END POINT //////////////////////////
  /*static login(
      {@required BuildContext context,
      @required String email,
      @required String password}) async {
    params.clear();
    await _dioSetting(false);
    params['email'] = email;
    params['password'] = password;
    print(params.toString());
    response = await dio.post("/authentication", data: params);
    print(response);
    return response;
  }*/

  /*static postReport({
    @required BuildContext context,
    @required String formname,
    @required String desc,
    @required String projectid,
    @required String reportno,
    @required String employer,
    @required String executor,
    @required String vendor,
    @required File image,
  }) async {
    try {
      params.clear();
      Dio dio = await _dioSetting(true);
      FormData formData = FormData.fromMap({
        "report[PROJECT_ID]": projectid,
        "report[FORM_NAME]": formname,
        "report[report_no]": reportno,
        "report[report_employer]": employer,
        "report[report_executor]": executor,
        "report[report_vendor]": vendor,
        "report[report_date]": "2019-07-16",
        "report[report_location]": "kuningan",
        "report[report_status]": "Draft",
        "form[workdesc][report_work_description]": desc,
        "attachments[0][at_status]": "Actived",
        "attachments[0][at_title]": "flutter",
        "attachments[0][at_link]": await MultipartFile.fromFile(
            image.path,
            filename: basename(image.path))
      });

      response = await dio.post("/report", data: formData);
      return response;
    } on DioError catch (e) {
      return print("Dio err :"+e.toString());
    }
  }*/

  /*static getReport({@required BuildContext context}) async {
    params.clear();
    try {
      Dio dio = await _dioSetting(true);
      response = await dio.get("/report");
      print("AAA" + response.toString());
      return response;
    } on DioError catch (e) {
      return ReportResponse.fromJson({'message': e.message});
    }
  }*/

  static Future <bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }

  /*static getListBulanan({@required BuildContext context}) async {
    params.clear();
    try {
      Dio dio = await _dioSetting(true);
      response = await dio.get("/laporan/bulanan");
      print("AAA" + response.toString());
      return response;
    } on DioError catch (e) {
      return ReportResponse.fromJson({'message': e.message});
    }
  }

  static getType({@required BuildContext context}) async {
    params.clear();
    try {
      Dio dio = await _dioSetting(true);
      response = await dio.get("/forms/tipe");
      print("AAA" + response.toString());
      return response;
    } on DioError catch (e) {
      return ReportResponse.fromJson({'message': e.message});
    }
  }

  static getDetailBulanan(
      {@required BuildContext context,
        @required int id}) async {
    params.clear();
    params['id'] = id.toString();
    print('ID detail : '+id.toString());
    try {
      Dio dio = await _dioSetting(true);
      //response = await dio.get("/laporan/bulanan/detail",queryParameters: params);
      print("Ini response nya : " + response.toString());
      return response;
    } on DioError catch (e) {
      return ReportResponse.fromJson({'message': e.message});
    }
  }*/
}
