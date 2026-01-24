import 'package:flutter/material.dart';
import 'package:restaurantpro/screen/pos.dart';
import 'package:restaurantpro/screen/proparticepage.dart';
import 'package:restaurantpro/screen/table.dart';

import 'dashboard.dart';
import '../core/model/datamodel.dart';
import 'employepage.dart';
class Systemsetting extends StatefulWidget {
  const Systemsetting({super.key});

  @override
  State<Systemsetting> createState() => _SystemsettingState();
}

class _SystemsettingState extends State<Systemsetting> {

  final settings = SystemSettings(
    restaurantInfo: RestaurantInfo(
      "RestaurantPro",
      "123 Main Street, Dhaka, Bangladesh",
      "+880 1711-123456",
      "info@restaurantpro.com",
    ),
    businessSettings: BusinessSettings(
      "USD (\$)",
      "Asia/Dhaka (GMT+6)",
      "10%",
      "5%",
    ),
    notificationSettings: NotificationSettings(true, true, true, true),
    paymentSettings: PaymentSettings(true, true, true, true),
    printerSettings: PrinterSettings("Connected", "Connected", true, false),
    userManagement: UserManagement(12, 2, 10, true),
    securitySettings: SecuritySettings(true, "30 minutes", "Strong", true),
    dataManagement: DataManagement(
      "Daily at 2:00 AM",
      "2 years",
      "CSV, PDF, Excel",
      "Today, 2:00 AM",
    ),
    systemInformation: SystemInformation(
      "v2.5.1",
      "Professional",
      "Dec 31, 2026",
      "24/7 Active",
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("System Settings",style: TextStyle(fontSize: 20),),
              SizedBox(height: 7,),
              Text("Configure restaurant management system"),
            ],
          ),SizedBox(height: 10,),
          buildSection(
            title: "Restaurant Information",
            children: [
              row("Restaurant Name", settings.restaurantInfo.name),
              row("Address", settings.restaurantInfo.address),
              row("Phone", settings.restaurantInfo.phone),
              row("Email", settings.restaurantInfo.email),
            ],
          ),

          buildSection(
            title: "Business Settings",
            children: [
              row("Currency", settings.businessSettings.currency),
              row("Timezone", settings.businessSettings.timezone),
              row("Tax Rate", settings.businessSettings.taxRate),
              row("Service Charge", settings.businessSettings.serviceCharge),
            ],
          ),

          buildSection(
            title: "Notification Settings",
            children: [
              boolRow("New Order Alert", settings.notificationSettings.newOrder),
              boolRow("Low Stock Alert", settings.notificationSettings.lowStock),
              boolRow("Daily Report", settings.notificationSettings.dailyReport),
              boolRow("Customer Feedback", settings.notificationSettings.feedback),
            ],
          ),

          buildSection(
            title: "Payment Settings",
            children: [
              boolRow("Accept Cash", settings.paymentSettings.cash),
              boolRow("Accept Card", settings.paymentSettings.card),
              boolRow("Accept Mobile Payment", settings.paymentSettings.mobile),
              boolRow("Split Bill", settings.paymentSettings.split),
            ],
          ),

          buildSection(
            title: "Printer Settings",
            children: [
              row("Kitchen Printer", settings.printerSettings.kitchen),
              row("Receipt Printer", settings.printerSettings.receipt),
              boolRow("Auto Print KOT", settings.printerSettings.autoKOT),
              boolRow("Auto Print Bill", settings.printerSettings.autoBill),
            ],
          ),

          buildSection(
            title: "User Management",
            children: [
              row("Total Users", settings.userManagement.total.toString()),
              row("Admin Users", settings.userManagement.admin.toString()),
              row("Staff Users", settings.userManagement.staff.toString()),
              boolRow("Role-Based Access", settings.userManagement.roleAccess),
            ],
          ),

          buildSection(
            title: "Security",
            children: [
              boolRow("Two-Factor Auth", settings.securitySettings.twoFA),
              row("Session Timeout", settings.securitySettings.timeout),
              row("Password Policy", settings.securitySettings.passwordPolicy),
              boolRow("Activity Logging", settings.securitySettings.logging),
            ],
          ),

          buildSection(
            title: "Data Management",
            children: [
              row("Auto Backup", settings.dataManagement.backupTime),
              row("Data Retention", settings.dataManagement.retention),
              row("Export Format", settings.dataManagement.export),
              row("Last Backup", settings.dataManagement.lastBackup),
            ],
          ),

          buildSection(
            title: "System Information",
            children: [
              row("Version", settings.systemInformation.version),
              row("License", settings.systemInformation.license),
              row("Valid Until", settings.systemInformation.validUntil),
              row("Support", settings.systemInformation.support),
            ],
          ),
        ],
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

  Widget buildSection({required String title, required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue, // background color
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(Icons.home_outlined, color: Colors.white),
                  // const SizedBox(width: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget boolRow(String label, bool value) {
    return row(label, value ? "Enabled" : "Disabled");
  }



}
