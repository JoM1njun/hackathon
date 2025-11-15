import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart'; // 슬라이딩 바 (버스 정보 패널)
import '../widgets/map_view.dart';
import '../widgets/tab_bar.dart';
import '../widgets/bus_info.dart';
import '../services/bus_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // tab_bar의 화면 전환용
  double panelOpacity = 0.0; // 패널 내용 투명도

  final PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
    getRoutes(); // 앱 실행 시 자동으로 API 호출 → 출력 보임
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: KakaoMapScreen()),

          SlidingUpPanel(
            controller: _panelController,
            minHeight: 125, // 손잡이만 보이는 높이
            maxHeight: 500,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            // panel 배경 제거
            backdropEnabled: false,
            renderPanelSheet: false, // 패널 자체 배경 제거
            parallaxEnabled: false,

            // 패널이 올라가는 정도(0~1)를 감지
            onPanelSlide: (pos) {
              setState(() {
                panelOpacity = pos; // 올라갈수록 내용이 선명해짐
              });
            },

            // 패널 내부
            panelBuilder: (sc) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // 전체 패널 투명
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    // 손잡이
                    Container(
                      height: 40,
                      child: Center(
                        child: Container(
                          width: 80,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    // ⭐ 내용이 서서히 나타나는 영역
                    Expanded(
                      child: Opacity(
                        opacity: panelOpacity, // 0~1
                        child: BusInfoPanel(controller: sc),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            // tab_bar의 위치
            bottom: 30,
            left: 20,
            right: 20,
            child: CustomBottomBar(
              selectedIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });

                if (index == 1) {
                  Navigator.pushNamed(context, '/places');
                } else if (index == 2) {
                  Navigator.pushNamed(context, '/favorite');
                } else if (index == 3) {
                  Navigator.pushNamed(context, '/etc');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
