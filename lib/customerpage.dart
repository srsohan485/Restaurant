import 'package:flutter/material.dart';
import 'package:restaurantpro/pos.dart';
import 'package:restaurantpro/proparticepage.dart';
import 'package:restaurantpro/table.dart';

import 'dashboard.dart';
import 'datamodel.dart';
import 'employepage.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Add Customer Button
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer Management",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 7,),
                  Text("Manage customer information and loyalty"),
                  SizedBox(height: 7,),
                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text("Add Customer",style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),


                ],
              ),

              const SizedBox(height: 12),

              // Stats Cards
              Column(
                children: [
                  statCard("Total Customers", "6", Colors.blue),
                  statCard("Total Revenue", "\$6042.00", Colors.green),
                  statCard("Avg Order Value", "\$28.37", Colors.orange),
                ],
              ),

              const SizedBox(height: 12),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Search customers by name, phone, or email",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Customer Card (List)
              ListView.builder(
                itemCount: customers.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final c = customers[index];
                  return customerCard(c);
                },
              ),
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

  Widget statCard(String title, String value, Color color) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14)),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget customerCard(Customer c) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),SizedBox(height: 5,),

                            Row(
                              children: List.generate(5, (index) {
                                if (index + 1 <= c.rating) {
                                  return const Icon(Icons.star, color: Colors.amber, size: 16);
                                }
                                else if (index + 0.5 <= c.rating) {
                                  return const Icon(Icons.star_half, color: Colors.amber, size: 16);
                                }
                                else {
                                  return const Icon(Icons.star_border, color: Colors.amber, size: 16);
                                }
                              }),
                            ),
                          ],
                        ),SizedBox(height: 10,),
                        Column(
                          children: [
                            const Text("Loyalty",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 5,),
                            Text(
                              "${c.loyaltyPoints}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                SizedBox(height: 3,),
                Row(
                    children: [
                      const Icon(Icons.phone, size: 16),
                      const SizedBox(width: 6),
                      Text(c.phone),
                    ],
                  ),

                  Row(
                    children: [
                      const Icon(Icons.email, size: 16),
                      const SizedBox(width: 6),
                      Text(c.email),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          c.address,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Orders: ${c.totalOrders}"),
                      Text("\$${c.totalSpent}",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                      Text(c.lastVisit),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
