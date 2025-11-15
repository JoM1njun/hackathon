import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<BottomBarItem> items = [
    BottomBarItem(icon: Icons.home, label: "홈"),
    BottomBarItem(icon: Icons.place, label: "장소"),
    BottomBarItem(icon: Icons.favorite, label: "좋아요"),
    BottomBarItem(icon: Icons.menu, label: "기타"),
  ];

  CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .asMap()
            .entries
            .map((entry) => _buildItem(entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _buildItem(int index, BottomBarItem item) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(item.icon, color: isSelected ? Colors.blue : Colors.grey),
            SizedBox(width: isSelected ? 6 : 0),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                item.label,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 각 아이콘과 레이블 정보를 담는 모델
class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({required this.icon, required this.label});
}
