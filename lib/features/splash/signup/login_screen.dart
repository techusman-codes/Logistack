import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';
import 'package:logistics_app/features/splash/login/widget/input_field.dart';
import 'package:logistics_app/features/splash/login/widget/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final_formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  void dispose() {
    // Dispose controllers

    _passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 255, 251, 251),
          ), // Optional margin around the circle
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/splash_screen');
            },
          ),
        ),
        title: Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      // .... the body goes here
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(AppAssets.appIcon),
              Text(
                AppTexts.appName,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 40),
              Text('Welcome Back!', style: AppTextStyles.subHeading),
              SizedBox(height: 20),
              // emaail and password fields
              CustomInputField(
                hint: "Mobile Number",
                icon: Icons.check,
                keyboardType: TextInputType.emailAddress,
                Controller: _phoneController,
              ),
              SizedBox(height: 10),
              CustomInputField(
                hint: "password",
                icon: Icons.password,
                keyboardType: TextInputType.visiblePassword,
                Controller: _passwordController,
              ),

              // Forget Passsword
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forget_password');
                  },
                  child: Text(
                    'Forget your Password?',

                    style: AppTextStyles.subHeading.copyWith(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/start_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 246, 47, 12),
                    padding: const EdgeInsets.symmetric(vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Login", style: AppTextStyles.button),
                ),
              ),
              SizedBox(height: 30),
              // Divider text
              Center(
                child: Text(
                  'Or login with social account',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // social Icons
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: 'assets/images/google.jpg'),
                  SizedBox(width: 20),
                  SocialButton(icon: 'assets/icons/facebook.png'),
                ],
              ),
              SizedBox(height: 30),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up_screen');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppTextStyles.body.copyWith(color: AppColors.grey),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
