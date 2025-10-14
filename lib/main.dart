import 'package:flutter/material.dart';
import 'package:logistics_app/features/splash/presentation/screens/start_screen.dart';
import 'package:logistics_app/features/splash/signup/login_screen.dart';
import 'package:logistics_app/features/splash/presentation/screens/forget_password.dart';
import 'package:logistics_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:logistics_app/features/splash/signup/sign_up_screen.dart';
import 'package:logistics_app/features/splash/signup/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logistack',
      initialRoute: '/splash_screen',
      routes: {
        '/splash_screen': (context) => const SplashScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/forget_password': (context) => const ForgetPassword(),
        '/sign_up_screen': (context) => const SignupScreen(),
        '/verification_screen': (context) => const VerificationScreen(),
        '/start_screen': (context) => const StartScreen(),
      },
    );
  }
}
