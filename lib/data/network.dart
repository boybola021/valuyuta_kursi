
import 'dart:convert';
import 'dart:developer';

import 'package:valuyuta_kursi/core/apis.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
abstract class Network{
 Future<String?> getAllData({String baseUrl = Apis.baseUrl,String api = Apis.api,Map<String,String> header = Apis.header});
}
class HttpNetwork implements Network{
  @override
  Future<String?>getAllData({String baseUrl = Apis.baseUrl, String api = Apis.api, Map<String, String> header = Apis.header}) async{
   try{
     Uri url = Uri.https(baseUrl,api);
     final response = await get(url,headers: header);
     if(response.statusCode == 200){
       return response.body;
     }
   }catch(e){
     debugPrint(e.toString());
     return null;
   }
   return null;
  }
}