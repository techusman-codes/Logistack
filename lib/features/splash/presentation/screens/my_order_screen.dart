import 'package:flutter/material.dart';
import 'package:logistics_app/core/constant/app_colors.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
   String parcel = '';
  int selectedTab = 0;
  final tabs = ['All','Completed','Assigning','Cancelled'];
  final List<Order> orders = sampleOrders; // from models/order.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('My Orders'),
        actions: [CircleAvatar(profile)],
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchInput(controller bound to parcel),
            SizedBox(height: 12),
            ElevatedButton(Track order ),
            SizedBox(height: 12),
            _buildTabs(),
            SizedBox(height: 12),
            Expanded(child: ListView.builder( order cards ))
          ],
        ),
      ),
    );
  
  }
}

Widget _buildTabs() {
  return Row(
    children: List.generate(tabs.length, (i) {
      final selected = selectedTab == i;
      return GestureDetector(
        onTap: () => setState(() => selectedTab = i),
        child: Padding(
          padding: EdgeInsets.only(right: 16),
          child: Column(
            children: [
              Text(tabs[i], style: TextStyle(color: selected ? AppColors.primary : Colors.grey)),
              if (selected) Container(height:3, width:30, color: AppColors.primary)
            ],
          ),
        ),
      );
    }),
  );
}
