import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:restaurantpro/table.dart';

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
    WeeklySales(day: "Mon", orders: 120, sales: 3000.0),
    WeeklySales(day: "Tue", orders: 150, sales: 4500.0),
    WeeklySales(day: "Wed", orders: 110, sales: 3200.0),
    WeeklySales(day: "Thu", orders: 140, sales: 3800.0),
    WeeklySales(day: "Fri", orders: 160, sales: 6000.0),
    WeeklySales(day: "Sat", orders: 130, sales: 4200.0),
    WeeklySales(day: "Sun", orders: 100, sales: 2800.0),
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
        currentIndex: 0,
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => StockRequisition()),
            // );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tablescreen()),
            );
          } else if (index == 3){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()),);
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
                  Color iconBgColor;
                  switch (stat.icon) {
                    case "revenue":
                      iconData = Icons.attach_money;
                      iconBgColor = Colors.green;
                      break;
                    case "orders":
                      iconData = Icons.list_alt;
                      iconBgColor = Colors.blue;
                      break;
                    case "tables":
                      iconData = Icons.table_chart;
                      iconBgColor = Colors.deepOrange;
                      break;
                    case "average":
                      iconData = Icons.show_chart;
                      iconBgColor = Colors.purple;
                      break;
                    default:
                      iconData = Icons.fastfood;
                      iconBgColor = Colors.green.shade100;
                  }


                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print("Clicked: ${stat.title}");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08), // shadow color
                            blurRadius: 10, // shadow softness
                            spreadRadius: 1,
                            offset: const Offset(0, 6), // নিচের দিকে shadow
                          ),
                        ],
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
                              color: iconBgColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(iconData, color: Colors.white, size: 22),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


                const SizedBox(height: 30),

                /// 🔹 Pie Chart (center)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weekly Sales Overview",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    SizedBox(
                      height: 250,
                      child: BarChart(
                        BarChartData(
                          maxY: weeklySalesList
                              .map((e) => e.sales)
                              .reduce((a, b) => a > b ? a : b) +
                              500,
                          barTouchData: BarTouchData(enabled: false),
                          alignment: BarChartAlignment.spaceAround,
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 36,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  int index = value.toInt();
                                  if (index >= 0 && index < weeklySalesList.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        weeklySalesList[index].day,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          barGroups: weeklySalesList.asMap().entries.map((entry) {
                            int index = entry.key;
                            WeeklySales data = entry.value;

                            final colors = [
                              Colors.blue,
                              Colors.green,
                              Colors.orange,
                              Colors.purple,
                              Colors.red,
                              Colors.teal,
                              Colors.indigo,
                            ];

                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: data.sales,
                                  width: 22,
                                  color: colors[index % colors.length],
                                  borderRadius: BorderRadius.circular(6),
                                  backDrawRodData: BackgroundBarChartRodData(
                                    show: false,
                                    toY: weeklySalesList
                                        .map((e) => e.sales)
                                        .reduce((a, b) => a > b ? a : b) +
                                        500,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
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
