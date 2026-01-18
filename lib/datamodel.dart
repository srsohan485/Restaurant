

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


enum StockStatus {
  good,
  low,
  medium,
}

enum ItemCategory {
  meat,
  vegetables,
  dairy,
  grains,
  spices,
  oils,
  herbs,
  all,
}

extension ItemCategoryExtension on ItemCategory {
  String get displayName {
    switch (this) {
      case ItemCategory.meat: return 'Meat';
      case ItemCategory.vegetables: return 'Vegetables';
      case ItemCategory.dairy: return 'Dairy';
      case ItemCategory.grains: return 'Grains';
      case ItemCategory.spices: return 'Spices';
      case ItemCategory.oils: return 'Oils';
      case ItemCategory.herbs: return 'Herbs';
      case ItemCategory.all: return 'All Categories';
    }
  }
}

class InventoryItem {
  final String id;
  final String name;
  final StockStatus status;
  final ItemCategory category;
  final double quantity;
  final String unit;
  final double minStock;
  final double unitPrice;
  final double totalValue;
  final DateTime lastUpdated;
  final bool isLowStock;

  InventoryItem({
    required this.id,
    required this.name,
    required this.status,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.minStock,
    required this.unitPrice,
    required this.lastUpdated,
  })  : totalValue = quantity * unitPrice,
        isLowStock = quantity < minStock;

  String get statusIcon {
    switch (status) {
      case StockStatus.good: return '✓';
      case StockStatus.low: return '⚠️';
      case StockStatus.medium: return '⚡';
    }
  }

  String get statusText {
    switch (status) {
      case StockStatus.good: return 'Good';
      case StockStatus.low: return 'Low';
      case StockStatus.medium: return 'Med';
    }
  }

  String get timeSinceUpdate {
    final now = DateTime.now();
    final difference = now.difference(lastUpdated);

    if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }
}

class InventorySummary {
  final int totalItems;
  final int lowStockItems;
  final double totalValue;
  final List<String> lowStockItemNames;

  InventorySummary({
    required this.totalItems,
    required this.lowStockItems,
    required this.totalValue,
    required this.lowStockItemNames,
  });

  String get lowStockAlert {
    if (lowStockItems == 0) return 'No items below minimum stock';
    return '$lowStockItems item(s) are below minimum stock level: ${lowStockItemNames.join(', ')}';
  }
}

class InventoryData {
  static List<InventoryItem> getSampleItems() {
    return [
      InventoryItem(
        id: '1',
        name: 'Chicken Breast',
        status: StockStatus.good,
        category: ItemCategory.meat,
        quantity: 45,
        unit: 'kg',
        minStock: 20,
        unitPrice: 8.50,
        lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      InventoryItem(
        id: '2',
        name: 'Basmati Rice',
        status: StockStatus.good,
        category: ItemCategory.grains,
        quantity: 120,
        unit: 'kg',
        minStock: 50,
        unitPrice: 3.20,
        lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
      ),
      InventoryItem(
        id: '3',
        name: 'Tomatoes',
        status: StockStatus.low,
        category: ItemCategory.vegetables,
        quantity: 15,
        unit: 'kg',
        minStock: 25,
        unitPrice: 2.50,
        lastUpdated: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      InventoryItem(
        id: '4',
        name: 'Onions',
        status: StockStatus.medium,
        category: ItemCategory.vegetables,
        quantity: 35,
        unit: 'kg',
        minStock: 30,
        unitPrice: 1.80,
        lastUpdated: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      // Add more items as per your data...
    ];
  }

  static InventorySummary getSummary(List<InventoryItem> items) {
    final lowStockItems = items.where((item) => item.isLowStock).toList();

    return InventorySummary(
      totalItems: items.length,
      lowStockItems: lowStockItems.length,
      totalValue: items.fold(0, (sum, item) => sum + item.totalValue),
      lowStockItemNames: lowStockItems.map((item) => item.name).toList(),
    );
  }
}



class InventoryFilter {
  static List<InventoryItem> filterItems({
    required List<InventoryItem> items,
    ItemCategory category = ItemCategory.all,
    StockStatus? status,
    String searchQuery = '',
  }) {
    return items.where((item) {
      // Category filter
      if (category != ItemCategory.all && item.category != category) {
        return false;
      }

      // Status filter
      if (status != null && item.status != status) {
        return false;
      }

      // Search query
      if (searchQuery.isNotEmpty) {
        final query = searchQuery.toLowerCase();
        return item.name.toLowerCase().contains(query) ||
            item.category.displayName.toLowerCase().contains(query);
      }

      return true;
    }).toList();
  }

  static List<InventoryItem> getLowStockItems(List<InventoryItem> items) {
    return items.where((item) => item.isLowStock).toList();
  }

  static List<InventoryItem> sortByStatus(List<InventoryItem> items) {
    final order = {StockStatus.low: 1, StockStatus.medium: 2, StockStatus.good: 3};
    return items.toList()
      ..sort((a, b) => order[a.status]!.compareTo(order[b.status]!));
  }
}











