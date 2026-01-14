import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'datamodel.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<DashboardStat> dashboardStats = [
    DashboardStat(
      title: "Today's Revenue",
      value: "\$2,450",
      change: "+12.5%",
      isPositive: true,
      icon: "revenue",
    ),
    DashboardStat(
      title: "Total Orders",
      value: "156",
      change: "+8.2%",
      isPositive: true,
      icon: "orders",
    ),
    DashboardStat(
      title: "Active Tables",
      value: "12/20",
      change: "60%",
      isPositive: true,
      icon: "tables",
    ),
    DashboardStat(
      title: "Avg. Order Value",
      value: "\$15.70",
      change: "+5.3%",
      isPositive: true,
      icon: "average",
    ),
  ];

  List<WeeklySales> weeklySalesList = [
    WeeklySales(day: "Mon", orders: 120, sales: 3000),
    WeeklySales(day: "Tue", orders: 150, sales: 4500),
    WeeklySales(day: "Wed", orders: 110, sales: 3200),
    WeeklySales(day: "Thu", orders: 140, sales: 3800),
    WeeklySales(day: "Fri", orders: 160, sales: 6000),
    WeeklySales(day: "Sat", orders: 130, sales: 4200),
    WeeklySales(day: "Sun", orders: 100, sales: 2800),
  ];

  final List<RecentOrder> recentOrders = [
    RecentOrder(orderId: "#ORD-1234", table: "Table 5", amount: "\$45.50", status: "Completed"),
    RecentOrder(orderId: "#ORD-1235", table: "Table 2", amount: "\$28.00", status: "Preparing"),
    RecentOrder(orderId: "#ORD-1236", table: "Table 8", amount: "\$72.30", status: "Served"),
    RecentOrder(orderId: "#ORD-1237", table: "Table 1", amount: "\$36.80", status: "Completed"),
    RecentOrder(orderId: "#ORD-1238", table: "Table 12", amount: "\$58.20", status: "Preparing"),
  ];


  final List<TopDish> topDishes = [
    TopDish(rank: 1, name: "Butter Chicken", revenue: "\$540", orders: "45 orders"),
    TopDish(rank: 2, name: "Biryani Special", revenue: "\$494", orders: "38 orders"),
    TopDish(rank: 3, name: "Paneer Tikka", revenue: "\$384", orders: "32 orders"),
    TopDish(rank: 4, name: "Naan Combo", revenue: "\$224", orders: "28 orders"),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'ResturanPro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF1C398E), // #1C398E
                Color(0xFF162456), // #162456
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alert'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔹 3 Center Text
                const Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Welcome back! Here's what's happening today.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                ElevatedButton.icon(
                  onPressed: () {
                    // button click action
                  },
                  icon: const Icon(Icons.access_time),
                  label: const Text(
                    'Last updated: Just now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),


                const SizedBox(height: 20),

                /// 🔹 GridView (4 items - center look)
              /// 🔹 GridView (4 items - center look)
              GridView.builder(
                itemCount: dashboardStats.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 165.57 / 91.96,
                ),
                itemBuilder: (context, index) {
                  final DashboardStat stat = dashboardStats[index];

                  // icon map: string -> IconData
                  IconData iconData;
                  switch (stat.icon) {
                    case "revenue":
                      iconData = Icons.attach_money;
                      break;
                    case "orders":
                      iconData = Icons.list_alt;
                      break;
                    case "tables":
                      iconData = Icons.table_chart;
                      break;
                    case "average":
                      iconData = Icons.monetization_on;
                      break;
                    default:
                      iconData = Icons.fastfood;
                  }

                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print("Clicked: ${stat.title}");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stat.title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  stat.value,
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  stat.change,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: stat.isPositive ? Colors.green : Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(iconData, color: Colors.blue, size: 22),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),






                const SizedBox(height: 30),

                /// 🔹 Pie Chart (center)
                SizedBox(
                  height: 220,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                      sections: [
                        PieChartSectionData(
                          value: 40,
                          color: Colors.blue,
                          title: 'Food',
                          radius: 60,
                        ),
                        PieChartSectionData(
                          value: 30,
                          color: Colors.orange,
                          title: 'Drinks',
                          radius: 60,
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.green,
                          title: 'Snacks',
                          radius: 60,
                        ),
                        PieChartSectionData(
                          value: 10,
                          color: Colors.red,
                          title: 'Others',
                          radius: 60,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// 🔹 Center Text
                const Text(
                  "Sales by Category",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
