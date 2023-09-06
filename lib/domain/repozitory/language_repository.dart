


import 'dart:convert';

import '../../core/local_data_source.dart';
import '../models/language_model.dart';

abstract class LanguageRepository{
  Future<bool> storeLanguage(LanguageModel language);
  List<LanguageModel>readLanguage();
}

class LanguageRepositoryImpl implements LanguageRepository{
  final LocalDataSource source;
  const LanguageRepositoryImpl({required this.source});
  @override
  List<LanguageModel> readLanguage(){
    String? response = source.read(StorageKey.language) ?? "[]";
    List json = jsonDecode(response);
    return json.map((item) => LanguageModel.fromJson(item as Map<String,Object?>)).toList();
  }

  @override
  Future<bool> storeLanguage(LanguageModel language) async{
    List<LanguageModel>list = readLanguage();
    list.clear();
    list.add(language);
    final json = list.map((item) => item.toJson()).toList();
    final data = jsonEncode(json);
    return source.store(StorageKey.language, data);
  }
}