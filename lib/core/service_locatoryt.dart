

import 'package:valuyuta_kursi/core/local_data_source.dart';
import 'package:valuyuta_kursi/domain/repozitory/language_repository.dart';

import '../data/network.dart';
import '../domain/repozitory/valuta_repozitory.dart';

late final ValyutaRepozitory repozitory;
late final LanguageRepository languageRepository;

 void serviceLocator()async{
  repozitory = ValyutaRepozitoryImplamets(network: HttpNetwork(),);
}

void serviceLocalDataSource()async{
 final db = await LocalDataSourceImpl.init;
 LocalDataSource source = LocalDataSourceImpl(db: db);
 languageRepository = LanguageRepositoryImpl(source: source);
}