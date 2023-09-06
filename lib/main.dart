
import 'package:valuyuta_kursi/app/app.dart';

import 'core/service_locatoryt.dart';
import 'package:flutter/material.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   serviceLocator();
  serviceLocalDataSource();
  runApp(const App());
}
