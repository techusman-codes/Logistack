import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistics_app/core/constant/app_assets.dart';
import 'package:logistics_app/core/constant/app_colors.dart';
import 'package:logistics_app/core/constant/app_text_style.dart';
import 'package:logistics_app/core/widgets/custom_bottom_navbar.dart';
import 'package:logistics_app/core/widgets/transport_card.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // Transport card selection
  int? selectedTransportIndex;

  final data = [
    {'title': 'Delivery man', 'asset': 'assets/images/deliveryman.jpg'},
    {'title': 'Truck', 'asset': 'assets/images/truck.jpg'},
    {'title': 'Airplane', 'asset': 'assets/icons/aeroplane.png'},
    {'title': 'Boat', 'asset': 'assets/icons/boat.png'},
  ];

  // responsive columns: computed in build because MediaQuery needs context

  final List<Map<String, dynamic>> statusList = [
    {"color": Colors.blue, "title": "Pick it up from", "location": "London"},
    {"color": Colors.deepOrange, "title": "Deliver to ", "location": "Texas"},
  ];

  int selectedBox = 0;

  final List<String> items = ['Deprtmet', 'National', 'Internation'];

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Usman 👋",
                          style: AppTextStyles.body.copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "We are ready\nto serve",
                          style: AppTextStyles.heading.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            height: 1.05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: _image != null
                              ? FileImage(File(_image!.path))
                              : AssetImage(AppAssets.profilepic)
                                    as ImageProvider,
                        ),

                        // 2️⃣ Positioned Icon
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage, // function to pick new image
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.danger,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Boxes
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(items.length, (index) {
                      bool isSelected = selectedBox == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBox = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.success
                                : AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.success
                                  : AppColors.background,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  items[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: List.generate(statusList.length, (index) {
                      final item = statusList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            // 1️⃣ Circle
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: item["color"],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),

                            // 2️⃣ First text (title)
                            Expanded(
                              flex: 3,
                              child: Text(
                                item["title"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),

                            // 3️⃣ Second text (status)
                            Expanded(
                              flex: 2,
                              child: Text(
                                item["location"],
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            // 4️⃣ Icon at the end
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Types of Services',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Padding(
                  padding: EdgeInsetsGeometry.all(16.0),
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final int crossAxis = width > 800
                              ? 4
                              : width > 600
                              ? 3
                              : 2;
                          return GridView.count(
                            physics:
                                const NeverScrollableScrollPhysics(), // let parent scroll
                            shrinkWrap: true, // important
                            crossAxisCount: crossAxis,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio:
                                1.1, // match TransportCard aspectRatio
                            children: List.generate(data.length, (index) {
                              return TransportCard(
                                title: data[index]['title']!,
                                assetPath: data[index]['asset']!,
                                isSelected: selectedTransportIndex == index,
                                onTap: () {
                                  setState(() {
                                    selectedTransportIndex = index;
                                  });
                                },
                                onAction: () => print ('action${data[index]['title']}')
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottom Navigation Bar
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/start_screen');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/tracking');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/routeName');
          }
        },
      ),
      //
    );
  }
}
