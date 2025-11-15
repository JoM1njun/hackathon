import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart'; // kakao Map API 연결
import 'package:dtrip/screens/main_home.dart'; // main_home.dart
import 'package:dtrip/screens/places.dart'; // Place.dart
import 'package:firebase_core/firebase_core.dart'; // DB 연결
import 'firebase_options.dart'; // DB 연결

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Firebase 초기화
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Kakao Map
  AuthRepository.initialize(appKey: '124e4b785cbdd3fc46a37b0abd30547f');

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
