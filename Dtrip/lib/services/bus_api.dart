import 'package:http/http.dart' as http;

Future<void> getRoutes() async {
  final url = Uri.parse(
    'http://openapitraffic.daejeon.go.kr/api/rest/busRouteInfo/getBusRouteList'
    '?serviceKey=9152a33db8805474901b834fd11ad3fe3a2e69a432d7468eee1fde7afe57de2d',
  );

  final response = await http.get(url);

  print(response.body);
}
