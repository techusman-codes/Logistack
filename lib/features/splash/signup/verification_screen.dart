import 'package:flutter/material.dart';

import 'package:logistics_app/core/constant/app_colors.dart';

import 'package:logistics_app/core/constant/app_text_style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // Dispose controllers

    _passwordController.dispose();

    super.dispose();
  }

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
          'Verification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'Verify your account',
                style: AppTextStyles.subHeading.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'we have sent you 4 digit code to your phone',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subHeading.copyWith(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 69, 68, 68),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.success,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/verification_screen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 246, 47, 12),
                    padding: const EdgeInsets.symmetric(vertical: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Verify", style: AppTextStyles.button),
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
