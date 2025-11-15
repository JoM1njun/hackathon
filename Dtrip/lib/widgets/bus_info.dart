import 'package:flutter/material.dart';

final busList = [
  {
    "number": "버스 603",
    "route": "대전대 → 목원대",
    "startTime": "08:30",
    "endTime": "09:10",
  },
  {
    "number": "버스 216",
    "route": "원내동차고지 → 시청",
    "startTime": "09:00",
    "endTime": "09:40",
  },
  {
    "number": "버스 101",
    "route": "중앙시장 → 시청",
    "startTime": "09:15",
    "endTime": "09:55",
  },
  {
    "number": "버스 603",
    "route": "대전대 → 목원대",
    "startTime": "08:30",
    "endTime": "09:10",
  },
  {
    "number": "버스 216",
    "route": "원내동차고지 → 시청",
    "startTime": "09:00",
    "endTime": "09:40",
  },
];

class BusInfoPanel extends StatelessWidget {
  final ScrollController controller;
  const BusInfoPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: EdgeInsets.zero,
      itemCount: busList.length,
      itemBuilder: (context, index) {
        final bus = busList[index];
        return BusCard(
          busNumber: bus["number"]!,
          route: bus["route"]!,
          startTime: bus["startTime"]!,
          endTime: bus["endTime"]!,
        );
      },
    );
  }
}

class BusCard extends StatelessWidget {
  final String busNumber;
  final String route;
  final String startTime;
  final String endTime;

  const BusCard({
    super.key,
    required this.busNumber,
    required this.route,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            busNumber,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(route, style: TextStyle(fontSize: 13)),
          SizedBox(height: 4),
          Text(
            "$startTime → $endTime",
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
