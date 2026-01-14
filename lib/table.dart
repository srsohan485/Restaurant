import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'datamodel.dart';
class Tablescreen extends StatefulWidget {
  const Tablescreen({super.key});

  @override
  State<Tablescreen> createState() => _TableState();
}

class _TableState extends State<Tablescreen> {

  final List<TableSummary> tableSummaryList = [
    TableSummary(
      title: "Total Tables",
      count: 16,
      color: Colors.blue,
    ),
    TableSummary(
      title: "Available",
      count: 9,
      color: Colors.green,
    ),
    TableSummary(
      title: "Occupied",
      count: 5,
      color: Colors.red,
    ),
    TableSummary(
      title: "Reserved",
      count: 2,
      color: Colors.orange,
    ),
  ];



  final List<TableModel> tableList = [
    TableModel(tableNo: "T1", seats: 4, status: TableStatus.occupied),
    TableModel(
      tableNo: "T2",
      seats: 2,
      status: TableStatus.available,
      refNo: "#ORD-1234",
      timeText: "45 min",
    ),

    TableModel(tableNo: "T3", seats: 6, status: TableStatus.reserved),
    TableModel(
      tableNo: "T4",
      seats: 4,
      status: TableStatus.available,
      refNo: "#RSV-5678",
      timeText: "Reserved 7:00 PM",
    ),

    TableModel(tableNo: "T5", seats: 2, status: TableStatus.occupied),
    TableModel(
      tableNo: "T6",
      seats: 8,
      status: TableStatus.available,
      refNo: "#ORD-1235",
      timeText: "20 min",
    ),

    TableModel(tableNo: "T7", seats: 4, status: TableStatus.occupied),
    TableModel(
      tableNo: "T8",
      seats: 2,
      status: TableStatus.available,
      refNo: "#ORD-1236",
      timeText: "1h 10min",
    ),

    TableModel(tableNo: "T9", seats: 4, status: TableStatus.reserved),
    TableModel(
      tableNo: "T10",
      seats: 6,
      status: TableStatus.available,
      refNo: "#RSV-5679",
      timeText: "Reserved 8:00 PM",
    ),

    TableModel(tableNo: "T11", seats: 2, status: TableStatus.occupied),
    TableModel(
      tableNo: "T12",
      seats: 4,
      status: TableStatus.available,
      refNo: "#ORD-1237",
      timeText: "15 min",
    ),

    TableModel(tableNo: "T13", seats: 8, status: TableStatus.available),
    TableModel(tableNo: "T14", seats: 4, status: TableStatus.available),

    TableModel(tableNo: "T15", seats: 2, status: TableStatus.occupied),
    TableModel(
      tableNo: "T16",
      seats: 6,
      status: TableStatus.available,
      refNo: "#ORD-1238",
      timeText: "35 min",
    ),
  ];


  Color statusColor(TableStatus status) {
    switch (status) {
      case TableStatus.available:
        return Colors.green;
      case TableStatus.occupied:
        return Colors.red;
      case TableStatus.reserved:
        return Colors.orange;
    }
  }




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
        currentIndex: 2,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 3 Center Text
                    const Text(
                      "Table Management",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Monitor and manage restaurant tables",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),

                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tableSummaryList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1.6,
                      ),
                      itemBuilder: (context, index) {
                        final item = tableSummaryList[index];

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: item.color.withOpacity(0.18),
                                // blurRadius: 14,
                                offset: const Offset(-8, 0), // 👈 LEFT SIDE SHADOW

                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // 🔹 Title
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // 🔹 Count
                              Text(
                                item.count.toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: item.color,
                                ),
                              ),


                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),


                    SizedBox(
                      height: 500,
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: tableList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,  //card size
                        ),
                        itemBuilder: (context, index) {
                          final t = tableList[index];

                          return Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center, // Changed to center
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /// Table No + Status - FIXED
                                  Container(
                                    width: 32,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      t.tableNo,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                            
                                  const SizedBox(height: 6),
                            
                                  // Seats
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.people_alt_rounded, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${t.seats} seats",
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                            
                                  const SizedBox(height: 8),
                            
                                  // Status badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: statusColor(t.status),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      t.status.name.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                            
                                  const SizedBox(height: 4),
                            
                                  if (t.refNo != null)
                                    Text(
                                      t.refNo!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                            
                                  if (t.timeText != null)
                                    Text(
                                      t.timeText!,
                                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                                    ),


                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                ],
                ),
              ),
            ),
          ),
        ),

    );
  }
}

