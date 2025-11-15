import 'package:geolocator/geolocator.dart'; // 나침반 역할
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class LocationService {
  static Future<LatLng> getUserLocation() async {
    // 위치 서비스 활성화 여부 확인
    bool enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) return LatLng(37.5665, 126.9780); // 서비스 꺼져있으면 기본 좌표

    // 권한 체크
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // 권한 거절 시 기본 좌표
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return LatLng(37.5665, 126.9780);
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return LatLng(position.latitude, position.longitude);
  }
}
