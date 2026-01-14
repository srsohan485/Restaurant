import 'dart:ui';

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


