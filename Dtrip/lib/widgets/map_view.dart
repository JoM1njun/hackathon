import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import '../services/current_location.dart';
import '../services/location_compass.dart';

class KakaoMapScreen extends StatefulWidget {
  const KakaoMapScreen({super.key});

  @override
  State<KakaoMapScreen> createState() => _KakaoMapScreenState();
}

class _KakaoMapScreenState extends State<KakaoMapScreen> {
  // 지도를 제어하기 위한 컨트롤러
  KakaoMapController? mapController;
  LatLng? getUserLocation;
  double userHeading = 0.0;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    loadLocation();
    listenCompass();
  }

  Future<void> loadLocation() async {
    getUserLocation = await LocationService.getUserLocation();
    setState(() {});
  }

  void listenCompass() {
    CompassService.getHeadingStream().listen((heading) {
      setState(() {
        userHeading = heading;
      });
    });
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
            currentLevel: 4,
            markers: [
              Marker(
                markerId: 'user',
                latLng: getUserLocation!,
                markerImageSrc: 'assets/Location/gps_on.svg', // 마커 이미지
                //rotation: userHeading,
                width: 40,
                height: 40,
              ),
            ],
          ),
          Positioned(
            // 현재위치 찾기 버튼
            bottom: 100,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.6), // 완전 투명 적용됨
                shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withValues(alpha: (255 * 0.2)),
                //     blurRadius: 8,
                //     offset: Offset(0, 3),
                //   ),
                // ],
              ),
              child: IconButton(
                icon: Icon(Icons.my_location, color: Colors.black),
                onPressed: _moveToCurrentLocation,
                iconSize: 28,
                splashRadius: 28,
              ),
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
