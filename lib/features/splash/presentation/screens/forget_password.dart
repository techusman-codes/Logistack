import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';
import 'package:logistics_app/features/splash/login/widget/input_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
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
              Navigator.pushReplacementNamed(context, '/login_screen');
            },
          ),
        ),
        title: const Text(
          'Forget Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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
              Text(
                'Forget Password',
                style: AppTextStyles.subHeading.copyWith(fontSize: 20),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'please enter your email address. you will \n receive a link to create new password \n via email.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subHeading.copyWith(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 69, 68, 68),
                  ),
                ),
              ),

              SizedBox(height: 30),
              // emaail and password fields
              CustomInputField(
                hint: "email2", 
                icon: Icons.close,
                keyboardType: TextInputType.emailAddress,

              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.danger,
                    padding: const EdgeInsets.symmetric(vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("SEND", style: AppTextStyles.button),
                ),
              ),

              // Divider text

              // social Icons
            ],
          ),
        ),
      ),
    );
  }
}
