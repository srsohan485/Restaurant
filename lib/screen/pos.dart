import 'package:flutter/material.dart';
import 'package:restaurantpro/screen/table.dart';
import 'employepage.dart';
import 'dashboard.dart';
import '../core/model/datamodel.dart';
import 'proparticepage.dart';

class POSpage extends StatefulWidget {
  const POSpage({super.key});

  @override
  State<POSpage> createState() => _POSpageState();
}

class _POSpageState extends State<POSpage> {
  int selectedTab = 0;

  List<String> tabs = [
    "All Item",
    "Appetizers",
    "Main Course",
    "Beverages",
    "Desserts"
  ];

  // Example Menu Data
  List<MenuItem> menuItems = [
    MenuItem(
      name: 'Paneer Tikka',
      category: 'Appetizers',
      price: 10.99,
      isAvailable: true,
      icon: '🍽️',
    ),
    MenuItem(
      name: 'Samosa (2pcs)',
      category: 'Appetizers',
      price: 4.99,
      isAvailable: true,
      icon: '🥟',
    ),
    MenuItem(
      name: 'Vegetable Pakora',
      category: 'Appetizers',
      price: 6.99,
      isAvailable: true,
      icon: '🌿',
    ),
    MenuItem(
      name: 'Raita',
      category: 'Beverages',
      price: 2.99,
      isAvailable: true,
      icon: '🥛',
    ),

  ];

  List<MenuItem> get filteredMenuItems {
    String selectedCategory = tabs[selectedTab];
    if (selectedCategory == "All Item") {
      return menuItems;
    } else {
      return menuItems
          .where((item) => item.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          // action here
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Point of Sale",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            SizedBox(height: 10),
            Text("Select items to add to order"),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  tabs.length,
                      (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: selectedTab == index
                              ? Colors.orange
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: selectedTab == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Expanded GridView for menu items
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2 / 3, // vertical big card
                ),
                itemCount: filteredMenuItems.length,
                itemBuilder: (context, index) {
                  final item = filteredMenuItems[index];
                  return InkWell(
                    onTap: () {
                      print("Clicked on ${item.name}");
                    },
                    child: Card(
                      color: item.isAvailable ? Colors.white : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon with gradient background
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFFFEDD4),
                                    Color(0xFFFFF7ED),
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  item.icon,
                                  style: TextStyle(fontSize: 28),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(height: 8),
                            Text("\$${item.price.toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 14)),
                            SizedBox(height: 6),
                            Text(item.isAvailable ? "Available" : "Unavailable",
                                style: TextStyle(
                                    color: item.isAvailable
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => POSpage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tablescreen()),
            );
          } else if (index == 3){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeePage()),
            );
          }else if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'POS'),
          BottomNavigationBarItem(icon: Icon(Icons.table_chart), label: 'Tables'),
          BottomNavigationBarItem(icon: Icon(Icons.kitchen), label: 'Kitchen'),
          BottomNavigationBarItem(icon: Icon(Icons.view_day_sharp), label: 'Inventory'),
        ],
      ),

    );
  }
}
