
import 'dart:convert';
import 'dart:developer';

import 'package:test/test.dart';
import 'package:valuyuta_kursi/core/apis.dart';
import 'package:valuyuta_kursi/core/service_locatoryt.dart';
import 'package:valuyuta_kursi/data/network.dart';
void main(){
 List list = [ {
  "id": 57,
 "Code": "643",
 "Ccy": "RUB",
 "CcyNm_RU": "Российский рубль",
 "CcyNm_UZ": "Rossiya rubli",
 "CcyNm_UZC": "Россия рубли",
 "CcyNm_EN": "Russian Ruble",
 "Nominal": "1",
 "Rate": "127.10",
 "Diff": "-0.54",
 "Date": "01.08.2023"
},];
 final res = list.map((e) => e == "RUB");
 print(res);
}