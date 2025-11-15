import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/tab_bar.dart'; // tab_bar.dart
import 'package:cloud_firestore/cloud_firestore.dart'; // DB 연결용

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 메인 스크롤 화면
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
              // 🔥 tab bar 공간 확보 위해 bottom 패딩 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40), // 위, 아래 공간 확보
                  Container(
                    // 광고 창
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text("광고", style: TextStyle(fontSize: 36)),
                    ),
                  ),

                  const SizedBox(height: 20), // 위, 아래 공간 확보

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          print("See all 클릭");
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Popular 장소 패널
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // 1번째 장소
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // 장소 이름
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      // 장소 주소
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 14,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          // 좋아요 표시
                                          "666명이 좋아함",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 15),

                        // 2번째 장소
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1) 사진 영역
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 14,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          // 좋아요 표시
                                          "666명이 좋아함",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 15),

                        // 3번째 장소
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1) 사진 영역
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 14,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          // 좋아요 표시
                                          "666명이 좋아함",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommend",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          print("See all 클릭");
                          // 자세히 보기 페이지로 이동시키면 됨
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue, // 링크처럼 보이게
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Recommend 패널
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "666명이 좋아함",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 15),

                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "666명이 좋아함",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User Recommend",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          print("See all 클릭");
                          // 자세히 보기 페이지로 이동시키면 됨
                        },
                        child: Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue, // 링크처럼 보이게
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // User Recommend
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          // ABC 유저의 루트
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "666명이 좋아함",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 15),

                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  color: Colors.blueGrey,
                                  child: Image.asset(
                                    "assets/Places/sung/sung1.png",
                                    width: double.infinity,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "성심당 본점",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "대전광역시 중구 대종로\n480번길 15 (은행동 145)",
                                      style: TextStyle(fontSize: 11),
                                      softWrap: true,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "666명이 좋아함",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔥 Custom tab bar (HomeScreen과 동일한 형태)
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: CustomBottomBar(
              selectedIndex: 1, // Places 탭으로 설정
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushNamed(context, '/');
                }
                // index == 1은 현재 화면(아무 것도 안 함)
              },
            ),
          ),
        ],
      ),
    );
  }
}
