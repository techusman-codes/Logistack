import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final VoidCallback? onAddPhoto;
  final String? imagePath;

  const ProfileAvatar({
    super.key,
    this.radius = 50,
    this.onAddPhoto,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // CircleAvatar: shows picked image or default placeholder
          CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.lightGrey,
            backgroundImage: imagePath != null
                ? FileImage(File(imagePath!))
                : const AssetImage(AppAssets.profile) as ImageProvider,
          ),

          // Add Photo Icon (bottom-right)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: onAddPhoto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
