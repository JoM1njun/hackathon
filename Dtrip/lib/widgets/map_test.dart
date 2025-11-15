import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import '../services/current_location.dart';

class KakaoMapScreen extends StatefulWidget {
  const KakaoMapScreen({super.key});

  @override
  State<KakaoMapScreen> createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  // 지도를 제어하기 위한 컨트롤러
  KakaoMapController? mapController;
  LatLng? getUserLocation;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    loadLocation();
  }

  Future<void> loadLocation() async {
    getUserLocation = await LocationService.getUserLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (getUserLocation == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      body: Stack(
        children: [
          KakaoMap(
            // 1. 지도가 생성되었을 때 컨트롤러를 저장합니다.
            onMapCreated: (controller) {
              mapController = controller;
            },
            // 2. 초기 중심 좌표 설정 (서울시청)
            center: getUserLocation!,
            // 3. 줌 레벨 설정
            currentLevel: 3,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _moveToCurrentLocation,
              child: const Icon(Icons.my_location, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _moveToCurrentLocation() async {
    final userPos = await LocationService.getUserLocation();

    if (mapController != null) {
      mapController!.setCenter(userPos);
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("현재 위치로 이동합니다")));
  }
}
