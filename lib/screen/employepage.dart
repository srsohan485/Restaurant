import 'package:flutter/material.dart';
import 'package:restaurantpro/screen/pos.dart';
import 'package:restaurantpro/screen/proparticepage.dart';
import 'package:restaurantpro/screen/table.dart';
import 'dashboard.dart';
import '../core/model/datamodel.dart';


class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  final employees = EmployeeData.getEmployees();

  int selectedTab = 0;
  final List<String> tabs = [
    "All Categoris",
    "Meat",
    "Vegetables",
    "Dairy"
  ];

  @override
  Widget build(BuildContext context) {
    final summary = EmployeeData.getSummary(employees);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Text("Employee Management",style: TextStyle(fontSize: 22,color: Colors.black),),
              SizedBox(height: 10,),
              Text("Manage staff and performance"),
              SizedBox(height: 10,),
              _addButton(),
              const SizedBox(height: 12),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _summaryColumn(summary),
              ),
              const SizedBox(height: 16),
              _searchBox(),
              const SizedBox(height: 10,),
        
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
        
        
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: _employeeList(),
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



  Widget _addButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Employee'),
      ),
    );
  }

  Widget _summaryColumn(EmployeeSummary s) {
    return Column(
      children: [
        _summaryCard(
          'Total Employees',
          s.totalEmployees.toString(),
          Icons.people,
          Colors.blue,
        ),
        const SizedBox(height: 12),
        _summaryCard(
          'Active Now',
          s.activeEmployees.toString(),
          Icons.verified_user,
          Colors.green,
        ),
        const SizedBox(height: 12),
        _summaryCard(
          'Monthly Payroll',
          '\$${s.monthlyPayroll}',
          Icons.attach_money,
          Colors.orange,
        ),
      ],
    );
  }


  Widget _summaryCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),const SizedBox(width: 14),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color),
            ),
          ],
        ),
      ),
    );
  }




  Widget _searchBox() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search employees...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _employeeList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: employees.length,
      itemBuilder: (_, index) {
        final e = employees[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(e.name[0]),
            ),
            title: Text(e.name),
            subtitle: Text('${e.role.label}\n${e.phone}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: e.isActive ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    e.isActive ? 'ACTIVE' : 'INACTIVE',
                    style: TextStyle(
                      fontSize: 11,
                      color: e.isActive ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



