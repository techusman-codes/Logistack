import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';

class TransportCard extends StatelessWidget {
  final String title;
  final String assetPath; // image asset path (png or svg)
  final VoidCallback? onTap;
  final VoidCallback? onAction; // action button callback

  const TransportCard({
    super.key,
    required this.title,
    required this.assetPath,
    this.onTap,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    // fixed aspect ratio for consistent tile shape
    return AspectRatio(
      aspectRatio: 1.1, // tweak to get the look you want
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title at top-left
              Text(title, style: AppTextStyles.body.copyWith(fontSize: 14)),

              // Space between title and main content
              const Spacer(),

              // Row: image on left, action button on the right
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image - sized but not overflow
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.contain,
                      height: 64, // controls the size of illustration
                      // if using SvgPicture.asset, use that instead
                    ),
                  ),

                  const Spacer(),

                  // Circular action button
                  GestureDetector(
                    onTap: onAction,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.danger, // orange/red in your design
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
