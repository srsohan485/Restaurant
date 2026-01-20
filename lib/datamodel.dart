

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


enum EmployeeRole {
  manager,
  headChef,
  sousChef,
  staff,
}

extension EmployeeRoleExtension on EmployeeRole {
  String get label {
    switch (this) {
      case EmployeeRole.manager:
        return 'Manager';
      case EmployeeRole.headChef:
        return 'Head Chef';
      case EmployeeRole.sousChef:
        return 'Sous Chef';
      case EmployeeRole.staff:
        return 'Staff';
    }
  }
}

class Employee {
  final String id;
  final String name;
  final EmployeeRole role;
  final String phone;
  final DateTime joinedDate;
  final bool isActive;
  final double salary;

  Employee({
    required this.id,
    required this.name,
    required this.role,
    required this.phone,
    required this.joinedDate,
    required this.isActive,
    required this.salary,
  });
}


class EmployeeSummary {
  final int totalEmployees;
  final int activeEmployees;
  final double monthlyPayroll;

  EmployeeSummary({
    required this.totalEmployees,
    required this.activeEmployees,
    required this.monthlyPayroll,
  });
}


class EmployeeData {
  static List<Employee> getEmployees() {
    return [
      Employee(
        id: '1',
        name: 'Rahim Uddin',
        role: EmployeeRole.headChef,
        phone: '+880 1711-111111',
        joinedDate: DateTime(2023, 1, 10),
        isActive: true,
        salary: 1500,
      ),
      Employee(
        id: '2',
        name: 'Karim Ali',
        role: EmployeeRole.manager,
        phone: '+880 1812-222222',
        joinedDate: DateTime(2022, 8, 5),
        isActive: true,
        salary: 2000,
      ),
    ];
  }

  static EmployeeSummary getSummary(List<Employee> employees) {
    return EmployeeSummary(
      totalEmployees: employees.length,
      activeEmployees:
      employees.where((e) => e.isActive).length,
      monthlyPayroll:
      employees.fold(0, (sum, e) => sum + e.salary),
    );
  }
}



// Inventory Summary Model
class InventorySummary {
  final int totalItems;
  final int lowStockItems;
  final double totalValue;
  final List<String> lowStockNames;

  InventorySummary({
    required this.totalItems,
    required this.lowStockItems,
    required this.totalValue,
    required this.lowStockNames,
  });
}

// Inventory Item Model
class InventoryItem {
  final String name;
  final String category;
  final int quantity;
  final double price;
  final bool isLowStock;

  InventoryItem({
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    required this.isLowStock,
  });
}


final inventorySummary = InventorySummary(
  totalItems: 12,
  lowStockItems: 4,
  totalValue: 1423.00,
  lowStockNames: [
    "Tomatoes",
    "Paneer",
    "Cumin Seeds",
    "Coriander"
  ],
);

final List<InventoryItem> inventoryItems = [
  InventoryItem(
    name: "Chicken Breast",
    category: "Meat",
    quantity: 20,
    price: 350,
    isLowStock: false,
  ),
  InventoryItem(
    name: "Tomatoes",
    category: "Vegetables",
    quantity: 3,
    price: 60,
    isLowStock: true,
  ),
];














