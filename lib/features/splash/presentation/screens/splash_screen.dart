import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // to navigate to the Next Screen After 3secs
  void initState() {
    super.initState();
    // the logic to navigate to the next Screen aferter 3seca
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/login_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
