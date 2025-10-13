// lib/screens/signup/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_size.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';
import 'package:logistics_app/features/splash/login/widget/input_field.dart';
import 'package:logistics_app/features/splash/login/widget/proile_avatar.dart';
// if you keep the input widget there

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Example state for dropdown + optionally hold an image path
  String? _selectedCity;

  // NOTE: If you want to collect inputs, create controllers:
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _addressController = TextEditingController();

  // placeholder for selected image path/file
  String? _pickedImagePath;

  @override
  void dispose() {
    // Dispose controllers
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();

    _addressController.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();

  void _onAddPhoto() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // pick from gallery
      imageQuality: 80, // make image size smaller for faster loading
    );

    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });
    }
  }

  void _onSignUp() {
    debugPrint(
      'Sign up pressed:'
      ' ffname=${_firstnameController.text}, last=${_lastnameController.text}, phoneNo = ${_passwordController.toString()} city=$_selectedCity',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: AppTextStyles.heading.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // -> Profile avatar (centered)
                const SizedBox(height: 8),
                ProfileAvatar(
                  radius: 60,
                  onAddPhoto: _onAddPhoto,
                  imagePath: _pickedImagePath,
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Upload Picture',
                    style: AppTextStyles.subHeading.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // -> Full name
                // Using controllers here for capturing input values
                CustomInputField(
                  hint: "First Name",
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  Controller: _firstnameController,
                  // If your CustomInputField supports controllers, pass _nameController
                ),
                SizedBox(height: AppSizes.p16),

                // -> Email
                CustomInputField(
                  hint: "Last Name",
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  Controller: _lastnameController,
                ),
                SizedBox(height: AppSizes.p16),

                // -> Phone
                CustomInputField(
                  hint: " phone number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  Controller: _phoneController,
                ),
                SizedBox(height: AppSizes.p16),
                // -> City dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGrey),
                    ),
                    focusColor: AppColors.lightGrey,
                  ),
                  items: const [
                    DropdownMenuItem(value: "Zaria", child: Text("Zaria")),
                    DropdownMenuItem(value: "Kaduna", child: Text("Kaduna")),
                    DropdownMenuItem(value: "Abuja", child: Text("Abuja")),
                    DropdownMenuItem(value: "Lagos", child: Text("Lagos")),
                  ],
                  onChanged: (value) {
                    _selectedCity = value;
                  },
                  validator: (value) =>
                      value == null ? "Please select your city" : null,
                ),
                SizedBox(height: AppSizes.p16),
                // -> Address
                CustomInputField(
                  hint: "Home address",
                  icon: Icons.location_on_outlined,
                  keyboardType: TextInputType.streetAddress,
                  Controller: _addressController,
                ),
                SizedBox(height: AppSizes.p20),
                // -> Password
                CustomInputField(
                  hint: "Create a password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                  Controller: _passwordController,
                ),
                SizedBox(height: AppSizes.p16),

                SizedBox(height: 10),
                Center(
                  child: Text(
                    'By countiue i comfirm that i have read and agree to the terms and conditions and privacy policy.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subHeading.copyWith(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 69, 68, 68),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                // -> Signup button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 246, 47, 12),
                      padding: EdgeInsets.symmetric(vertical: AppSizes.p16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius12),
                      ),
                    ),
                    child: Text('Sign Up', style: AppTextStyles.button),
                  ),
                ),

                const SizedBox(height: 12),

                // -> Already have account
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account?",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(width: AppSizes.p8),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: AppColors.grey,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
