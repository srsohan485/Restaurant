

import 'package:flutter/material.dart';

class DashboardHeader {
  final String title;
  final String subtitle;
  final String lastUpdated;

  DashboardHeader({
    required this.title,
    required this.subtitle,
    required this.lastUpdated,
  });
}

class DashboardStat {
  final String title;
  final String value;
  final String change;
  final bool isPositive;
  final String icon; // asset or icon name

  DashboardStat({
    required this.title,
    required this.value,
    required this.change,
    required this.isPositive,
    required this.icon,
  });
}

class RecentOrder {
  final String orderId;
  final String table;
  final String amount;
  final String status;

  RecentOrder({
    required this.orderId,
    required this.table,
    required this.amount,
    required this.status,
  });
}

class TopDish {
  final int rank;
  final String name;
  final String revenue;
  final String orders;

  TopDish({
    required this.rank,
    required this.name,
    required this.revenue,
    required this.orders,
  });
}


class WeeklySales {
  final String day;
  final int orders;
  final double sales;

  WeeklySales({
    required this.day,
    required this.orders,
    required this.sales,
  });
}


class TableSummary {
  final String title;
  final int count;
  final Color color;

  TableSummary({
    required this.title,
    required this.count,
    required this.color,
  });
}



enum TableStatus { available, occupied, reserved }

class TableModel {
  final String tableNo;
  final int seats;
  final TableStatus status;
  final String? refNo;     // #ORD / #RSV
  final String? timeText; // 45 min / Reserved 7:00 PM
  final int guests;
  final double currentBill;

  bool isExpanded; // dropdown control

  TableModel({
    required this.tableNo,
    required this.seats,
    required this.status,
    this.refNo,
    this.timeText,
    this.guests = 0,
    this.currentBill = 0,
    this.isExpanded = false,
  });
}

// Menu Item Model
class MenuItem {
  final String name;
  final String category;
  final double price;
  final bool isAvailable;
  final String icon; // Optional, emoji or icon path

  MenuItem({
    required this.name,
    required this.category,
    required this.price,
    required this.isAvailable,
    this.icon = '🍽️',
  });
}

class Category {
  final String name;

  Category({required this.name});
}

List<Category> categories = [
  Category(name: 'All Items'),
  Category(name: 'Appetizers'),
  Category(name: 'Main Course'),
  Category(name: 'Beverages'),
  Category(name: 'Desserts'),
];






