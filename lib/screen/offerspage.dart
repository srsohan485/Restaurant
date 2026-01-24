import 'package:flutter/material.dart';
import 'package:restaurantpro/screen/pos.dart';
import 'package:restaurantpro/screen/proparticepage.dart';
import 'package:restaurantpro/screen/table.dart';
import 'dashboard.dart';
import '../core/model/datamodel.dart';
import 'employepage.dart';
import 'invetory.dart';
import 'kitchenpage.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: customAppBar(
        title: "ResturanPro",
        onMenuPressed: () => print("Menu clicked"),
        onNotificationPressed: () => print("Notification clicked"),
        onProfilePressed: () => print("Profile clicked"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Offers & Promotions",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text("Create and manage promotional campaigns"),
            SizedBox(height: 10,),
            _createOfferButton(),
            const SizedBox(height: 10),
            _summaryCards(),
            const SizedBox(height: 8),
            _offerCard(weekendOffer),
          ],
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KitchenOrderPage()),
            );
          }else if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InventoryPage()),
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

  Widget _createOfferButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add,color: Colors.white,),
        label: const Text("Create New Offer",style: TextStyle(color: Colors.white),),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // summary cards
  Widget _summaryCards() {
    return Column(
      children: summaryList.map((item) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.value.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.title,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Icon(item.icon, color: item.color),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _offerCard(OfferModel offer) {
    double progress = offer.used / offer.totalUsage;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            offer.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            offer.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 12),

          // Discount Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${offer.discountPercent}${offer.discountType} OFF",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Usage Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                offer.usageStatus,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "Usage ${offer.used} / ${offer.totalUsage}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white30,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
          ),

          const SizedBox(height: 12),

          // Date Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _dateChip("Valid From", offer.validFrom),
              _dateChip("Valid To", offer.validTo),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dateChip(String title, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        Text(
          "${date.day} Jan, ${date.year}",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

