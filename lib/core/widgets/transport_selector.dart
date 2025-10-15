import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';

class TransportSelector extends StatelessWidget {
  final int selected;
  final Function(int) onChanged;
  final List<Map<String, dynamic>> items; // title + icon asset

  const TransportSelector({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: List.generate(items.length, (i) {
                final isSel = i == selected;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => onChanged(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSel ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // illustration
                          Image.asset(items[i]['asset'], height: 36),
                          const SizedBox(height: 8),
                          Text(
                            items[i]['title'],
                            style: TextStyle(
                              color: isSel
                                  ? Colors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Triangle pointer under selected
          Positioned(
            bottom: -8,
            left:
                (MediaQuery.of(context).size.width / items.length) * selected +
                (MediaQuery.of(context).size.width / (items.length * 4)),
            child: CustomPaint(
              size: const Size(20, 10),
              painter: _TrianglePainter(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

Widget addressRow(String text, {VoidCallback? onAdd}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: AppTextStyles.body)),
        GestureDetector(
          onTap: onAdd,
          child: Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}


