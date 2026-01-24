import 'package:flutter/material.dart';
import 'package:restaurantpro/pos.dart';
import 'package:restaurantpro/proparticepage.dart';
import 'package:restaurantpro/table.dart';

import 'dashboard.dart';
import 'employepage.dart';
class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {

  final List<Map<String, dynamic>> metricCards = [
    {
      'title': 'Total Revenue',
      'value': '\$102,400',
      'change': '+23.9%',
      'icon': Icons.attach_money,
      'color': Colors.green,
    },
    {
      'title': 'Total Orders',
      'value': '2,025',
      'change': '+18.2%',
      'icon': Icons.shopping_cart,
      'color': Colors.blue,
    },
    {
      'title': 'Total Customers',
      'value': '1,550',
      'change': '+15.8%',
      'icon': Icons.people,
      'color': Colors.purple,
    },
    {
      'title': 'Avg Order Value',
      'value': '\$50.60',
      'change': '+4.5%',
      'icon': Icons.trending_up,
      'color': Colors.orange,
    },
  ];

  final List<double> monthlyRevenue = [14000, 16000, 18500, 22000, 19500, 21000];
  final List<int> orders = [380, 420, 500, 520, 480, 550];
  final List<int> customers = [280, 300, 370, 390, 350, 420];
  final List<int> hourlyOrders = [25, 45, 60, 55, 50, 40, 30];
  final List<String> hours = ['10 AM', '12 PM', '2 PM', '4 PM', '6 PM', '8 PM', '10 PM'];

  final List<Map<String, dynamic>> revenueByCategory = [
    {'category': 'Main Course', 'revenue': 45000, 'percentage': 45, 'color': Colors.blue},
    {'category': 'Beverages', 'revenue': 25000, 'percentage': 25, 'color': Colors.green},
    {'category': 'Appetizers', 'revenue': 18000, 'percentage': 18, 'color': Colors.orange},
    {'category': 'Desserts', 'revenue': 12000, 'percentage': 12, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Text("Reports & Analytics",style: TextStyle(fontSize: 20),),
                SizedBox(height: 7,),
                Text("Business insights and performance metrics"),
                SizedBox(height: 7,),
                Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '6 Months',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('Export'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 指标卡片
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: metricCards.length,
                itemBuilder: (context, index) {
                  return _buildMetricCard(metricCards[index]);
                },
              ),

              const SizedBox(height: 24),

              // 月度收入趋势
              _buildChartCard(
                title: 'Monthly Revenue Trend',
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      // Y轴标签
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: ['22K', '16.5K', '11K', '5.5K', '0']
                            .map((label) => Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)))
                            .toList(),
                      ),
                      const SizedBox(width: 8),
                      Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: monthlyRevenue.asMap().entries.map((entry) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: entry.value / 1000,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[400],
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'][entry.key],
                                          style: const TextStyle(fontSize: 12)),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),


              _buildChartCard(
                title: 'Orders & Customer Growth',
                child: SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: ['600', '450', '300', '150', '0']
                            .map((label) => Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)))
                            .toList(),
                      ),
                      const SizedBox(width: 8),
                      Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(6, (index) {
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [

                                          Container(
                                            height: customers[index] / 2,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[300],
                                              borderRadius: const BorderRadius.only(
                                                topLeft: Radius.circular(4),
                                                topRight: Radius.circular(4),
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: orders[index] / 2,
                                            decoration: BoxDecoration(
                                              color: Colors.orange[400],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                bottomRight: Radius.circular(4),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'][index],
                                              style: const TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildLegend('customers', Colors.blue[300]!),
                                const SizedBox(width: 16),
                                _buildLegend('orders', Colors.orange[400]!),
                              ],
                            ),
                          ],
                        ),

                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // 类别收入
                  Expanded(
                    child: _buildChartCard(
                      title: 'Revenue by Category',
                      child: Column(
                        children: [
                          ...revenueByCategory.map((category) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: category['color'],
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(category['category']),
                                  ),
                                  Text(
                                    '\$${category['revenue'].toString()}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '(${category['percentage']}%)',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 16),
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(
                                colors: revenueByCategory.map((c) => c['color'] as Color).toList(),
                                stops: [0.45, 0.7, 0.88, 1.0],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Main Course', style: TextStyle(color: Colors.blue)),
                              Text('Beverages', style: TextStyle(color: Colors.green)),
                              Text('Appetizers', style: TextStyle(color: Colors.orange)),
                              Text('Desserts', style: TextStyle(color: Colors.purple)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],


          ),
        ),
      ),

      //bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
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
          }else if (index == 4) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => POSpage()),
            // );
          }else if (index == 5) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => EmployeePage()),
            // );
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

  Widget _buildMetricCard(Map<String, dynamic> data) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data['title'],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['value'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                  decoration: BoxDecoration(
                    color: (data['change'] as String).startsWith('+') ? Colors.green[100] : Colors.red[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(data['icon'], color: data['color']),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: (data['change'] as String).startsWith('+') ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                data['change'],
                style: TextStyle(
                  color: (data['change'] as String).startsWith('+') ? Colors.green[800] : Colors.red[800],
                  fontSize: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildChartCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

}








