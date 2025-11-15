import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:dtrip/screens/main_home.dart';
import 'package:dtrip/screens/places.dart';

void main() {
  AuthRepository.initialize(appKey: '124e4b785cbdd3fc46a37b0abd30547f');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/places': (context) => PlacesScreen(),
        //'/favorite': (context) =>
      },
      // title: 'DTrip',
      // debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
    );
  }
}
