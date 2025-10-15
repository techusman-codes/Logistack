import 'package:flutter/material.dart';
import 'package:logistics_app/core/widgets/custom_bottom_navbar.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  // This variable will help us track which vehicle is selected (0 = Scooter)
  int selectedVehicle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/start_screen'),
        ),
        title: const Text(
          "Place Order",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      // The body of the screen
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVehicleSelector(), // 1️⃣ first section
            const SizedBox(height: 25),
            Text(
              "Add location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildLocationCard(),
            const SizedBox(height: 25),
            Text(
              "Pickup Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildPickupTime(),
            const SizedBox(height: 25),
            Text(
              "Item Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildItemDescription(),
            const SizedBox(height: 25),
            _buildFareSection(),
            const SizedBox(height: 20),
            _buildNextButton(),

            // More sections will come here later
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/start_screen');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/place_order');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/routeName');
          }
        },
      ),
    );
  }

  // ===== 1️⃣ Vehicle Selector (Scooter, Truck, Van) =====
  Widget _buildVehicleSelector() {
    final vehicles = [
      {'icon': Icons.two_wheeler, 'title': 'Scooter'},
      {'icon': Icons.local_shipping, 'title': 'Truck'},
      {'icon': Icons.directions_bus, 'title': 'Van'},
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(vehicles.length, (index) {
          bool isSelected = selectedVehicle == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedVehicle = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Column(
                children: [
                  Icon(
                    vehicles[index]['icon'] as IconData,
                    color: isSelected ? Colors.teal : Colors.grey,
                    size: 30,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    vehicles[index]['title'] as String,
                    style: TextStyle(
                      color: isSelected ? Colors.teal : Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ===== 2️⃣ Add Location Section =====
Widget _buildLocationCard() {
  return Column(
    children: [
      // Pickup address
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 6, backgroundColor: Colors.red),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                "24, Ocean avenue",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO: Handle location picker later
              },
              icon: const Icon(Icons.add_circle, color: Colors.teal, size: 28),
            ),
          ],
        ),
      ),

      const SizedBox(height: 12),

      // Drop off address
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 6, backgroundColor: Colors.grey),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                "Drop off address",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO: Handle location picker later
              },
              icon: const Icon(Icons.add_circle, color: Colors.teal, size: 28),
            ),
          ],
        ),
      ),
    ],
  );
}

// ===== 3️⃣ Pickup Time Section =====
Widget _buildPickupTime() {
  // to track selected AM/PM
  String selectedPeriod = 'AM';
  String selectedSlot = '10:00 - 12:00';

  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // AM button
              GestureDetector(
                onTap: () {
                  setState(() => selectedPeriod = 'AM');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedPeriod == 'AM'
                        ? Colors.deepOrange
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'AM',
                    style: TextStyle(
                      color: selectedPeriod == 'AM'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // PM button
              GestureDetector(
                onTap: () {
                  setState(() => selectedPeriod = 'PM');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selectedPeriod == 'PM'
                        ? Colors.orange
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'PM',
                    style: TextStyle(
                      color: selectedPeriod == 'PM'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              // Time slot
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        selectedSlot,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

// ===== 4️⃣ Item Description Section =====
Widget _buildItemDescription() {
  final List<String> items = [
    "Food",
    "Documents",
    "Clothings",
    "Car",
    "Digital Products",
    "Glass",
  ];

  List<String> selectedItems = [];

  return StatefulBuilder(
    builder: (context, setState) {
      return Wrap(
        spacing: 8,
        runSpacing: 10,
        children: items.map((item) {
          bool isSelected = selectedItems.contains(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedItems.remove(item);
                } else {
                  selectedItems.add(item);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepOrange : Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}

// ===== 5️⃣ Fare Section =====
Widget _buildFareSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Estimated Fare",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Moving Cart", style: TextStyle(color: Colors.grey)),
            Text(
              "\$138.00",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// ===== 6️⃣ Next Button =====
Widget _buildNextButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // TODO: Handle Next button tap
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrangeAccent,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        "Next",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
