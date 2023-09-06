
import 'dart:convert';
import 'package:valuyuta_kursi/core/apis.dart';
import 'package:valuyuta_kursi/data/network.dart';
import 'package:valuyuta_kursi/domain/models/money_model.dart';

abstract class ValyutaRepozitory{
  Future<List<Valyuta>> fetchData();
}
class ValyutaRepozitoryImplamets implements ValyutaRepozitory{
  final Network network;
  const ValyutaRepozitoryImplamets({required this.network, });

  @override
  Future<List<Valyuta>> fetchData() async{
  String response = await network.getAllData(baseUrl: Apis.baseUrl,) ?? "[]";
  final json = jsonDecode(response) as List;
  return json.map<Valyuta>((e) => Valyuta.fromJson(e as Map<String,Object?>)).toList();
  }
}