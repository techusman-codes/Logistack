import 'package:flutter/material.dart';

/// App color palette for SamLogistics
class AppColors {
  // Brand colors
  static const Color primary = Color(0xFF0066FF); // Bright blue
  static const Color secondary = Color(0xFFFFA500); // Accent orange
  static const Color success = Color(0xFF00C853); // Green
  static const Color danger = Color(0xFFFF3B30); // Red
  static const Color warning = Color(0xFFFFD600); // Yellow

  // Neutrals
  static const Color black = Color(0xFF1C1C1C);
  static const Color darkGrey = Color(0xFF3A3A3A);
  static const Color grey = Color(0xFF8E8E93);
  static const Color lightGrey = Color(0xFFE5E5EA);
  static const Color white = Color(0xFFFFFFFF);

  // Backgrounds
  static const Color background = Color(0xFFF7F9FB);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF1C1C1C);
  static const Color textSecondary = Color(0xFF6E6E6E);

  // Special
  static const Color info = Color(0xFF2196F3);
  static const Color border = Color(0xFFE0E0E0);
  static const Color shadow = Color(0x11000000); // light shadow transparency

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0066FF), Color(0xFF1E88E5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
