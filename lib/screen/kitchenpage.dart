import 'package:flutter/material.dart';
import 'package:restaurantpro/screen/pos.dart';
import 'package:restaurantpro/screen/proparticepage.dart';
import 'package:restaurantpro/screen/table.dart';
import 'dashboard.dart';
import '../core/model/datamodel.dart';
import 'employepage.dart';



enum OrderStatus { pending, preparing, ready, served }

class KitchenOrder {
  final String ticketNo;
  final String kotId;
  int waitMinutes;
  OrderStatus status;
  final List<String> items;
  final bool urgent;

  KitchenOrder({
    required this.ticketNo,
    required this.kotId,
    required this.waitMinutes,
    required this.items,
    required this.status,
    this.urgent = false,
  });
}

class KitchenOrderPage extends StatefulWidget {
  const KitchenOrderPage({super.key});

  @override
  State<KitchenOrderPage> createState() => _KitchenOrderPageState();
}

class _KitchenOrderPageState extends State<KitchenOrderPage> {
  late List<KitchenOrder> orders;

  @override
  void initState() {
    super.initState();

    orders = [
      KitchenOrder(
        ticketNo: "T5",
        kotId: "KOT-001",
        waitMinutes: 21,
        items: [
          "Butter Chicken",
          "Naan Bread",
          "Dal Makhani",
          "Paneer Butter Masala",
        ],
        status: OrderStatus.pending,
        urgent: true,
      ),
      KitchenOrder(
        ticketNo: "T2",
        kotId: "KOT-002",
        waitMinutes: 8,
        items: ["Fried Rice", "Chicken Chili"],
        status: OrderStatus.ready,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),

      // APP BAR
      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kitchen Order Tickets",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("Manage kitchen orders in real-time",),
            SizedBox(height: 10,),
            // PRINT ALL
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.print,color: Colors.white),
                label: const Text("Print All KOTs",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2563EB),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // STATUS SUMMARY
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,

            childAspectRatio: 1.4, // 🔥 আগে 2.4 ছিল, কমালে card boro hobe

            children: [
              statusCard("Pending", countStatus(OrderStatus.pending), Colors.orange),
              statusCard("Preparing", countStatus(OrderStatus.preparing), Colors.blue),
              statusCard("Ready", countStatus(OrderStatus.ready), Colors.green),
              statusCard("Served", countStatus(OrderStatus.served), Colors.grey),
            ],
          ),



          const SizedBox(height: 12),

            // ORDER LIST
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return orderCard(orders[index]);
                },
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KitchenOrderPage()),
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

  // COUNT STATUS
  String countStatus(OrderStatus status) {
    return orders.where((o) => o.status == status).length.toString();
  }

  // STATUS CARD
  Widget statusCard(String title, String count, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),

        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(title),
        ],
      ),
    );
  }


  // ORDER CARD
  Widget orderCard(KitchenOrder order) {
    Color headerColor = switch (order.status) {
      OrderStatus.pending => Colors.orange,
      OrderStatus.preparing => Colors.blue,
      OrderStatus.ready => Colors.green,
      OrderStatus.served => Colors.grey,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.ticketNo,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Text(order.kotId,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 12)),
                  ],
                ),
                Text("⏱ ${order.waitMinutes} min",
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),

          // ITEMS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: order.items
                  .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    const Icon(Icons.circle,
                        size: 8, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text(item),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),

          // FOOTER
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                chip(order.status.name.toUpperCase(), headerColor),
                if (order.urgent) chip("URGENT", Colors.red),
                const Spacer(),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Row(
            children: [
              // ACTION BUTTON
              if (order.status == OrderStatus.pending)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      order.status = OrderStatus.preparing;
                    });
                  },
                  child: const Text("Start Preparing"),
                ),

              if (order.status == OrderStatus.preparing)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      order.status = OrderStatus.ready;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ),
                  ),
                  child: const Text("Mark Ready"),
                ),SizedBox(width: 10,),
    SizedBox(
    width: 160,
    height: 40,
    child: ElevatedButton(
    onPressed: () {},
    child: const Text("Print"),
    ),
    ),SizedBox(height: 15,),
            ],
          )
        ],
      ),
    );
  }

  Widget chip(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
