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
  // Example state for dropdown + optionally hold an image path
  String? _selectedCity;
  final List<String> _cities = [
    'Lagos',
    'Abuja',
    'Zaria',
    'Kano',
    'Port Harcourt',
  ];

  // NOTE: If you want to collect inputs, create controllers:
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // placeholder for selected image path/file
  String? _pickedImagePath;

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
      ' name=${_nameController.text}, email=${_emailController.text}, city=$_selectedCity',
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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

              const SizedBox(height: 24),

              // -> Full name
              // Using controllers here for capturing input values
              CustomInputField(
                hint: "Enter your full name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
                // If your CustomInputField supports controllers, pass _nameController
              ),
              SizedBox(height: AppSizes.p16),

              // -> Email
              CustomInputField(
                hint: "Enter your email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: AppSizes.p16),

              // -> Phone
              CustomInputField(
                hint: "Enter your phone number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: AppSizes.p16),

              // -> Password
              CustomInputField(
                hint: "Create a password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              SizedBox(height: AppSizes.p16),

              // -> Confirm Password
              CustomInputField(
                hint: "Re-enter your password",
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              SizedBox(height: AppSizes.p16),

              // -> City dropdown
              DropdownButtonFormField<String>(
                value: _selectedCity,
                onChanged: (value) => setState(() => _selectedCity = value),
                decoration: InputDecoration(
                  labelText: 'City', // floating label style
                  hintText: 'Enter your valid city',
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius12),
                    borderSide: BorderSide(color: AppColors.border, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius12),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.2,
                    ),
                  ),
                ),
                items: _cities
                    .map(
                      (city) => DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: AppSizes.p16),

              // -> Address
              CustomInputField(
                hint: "Enter delivery address",
                icon: Icons.location_on_outlined,
                keyboardType: TextInputType.streetAddress,
              ),
              SizedBox(height: AppSizes.p20),

              // -> Signup button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.danger,
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
                        color: AppColors.textSecondary,
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
    );
  }
}
