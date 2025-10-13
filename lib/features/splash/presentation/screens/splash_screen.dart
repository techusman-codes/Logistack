import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text.dart';
import 'package:logistics_app/features/splash/signup/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToLogin,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //this will hold my backgrond image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // shadow overlay
          Container(
            color: const Color.fromARGB(255, 3, 31, 244).withOpacity(0.5),
          ),

          // logo and Text
          Align(
            alignment: Alignment(0, 0.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.appIcon),

                Text(
                  AppTexts.appName,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
