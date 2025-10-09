import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_colors.dart';

class CustomInputField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,

    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        TextField(
          keyboardType: widget.keyboardType,
          obscureText: _obscure,
          decoration: InputDecoration(
            labelText: widget.hint,
            hintText: widget.hint,

            // 👇 Hint text style
            hintStyle:
                (Theme.of(context).textTheme.labelMedium ?? const TextStyle())
                    .copyWith(
                      color: AppColors.textSecondary.withOpacity(0.6),
                      fontSize: 14,
                    ),

            // 👇 Padding inside the input
            contentPadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),

            // 👇 Border styles
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.border.withOpacity(0.3), // light border
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lightGrey.withOpacity(0.8),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: AppColors.white,

            // 👇 Icon positioning
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.lightGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(widget.icon, color: AppColors.lightGrey),
                  ),
          ),
        ),
      ],
    );
  }
}


