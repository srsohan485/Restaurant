import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required String title,
  VoidCallback? onMenuPressed,
  VoidCallback? onNotificationPressed,
  VoidCallback? onProfilePressed,
}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: onMenuPressed ?? () {},
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: onNotificationPressed ?? () {},
      ),
      IconButton(
        icon: const Icon(Icons.person, color: Colors.white),
        onPressed: onProfilePressed ?? () {},
      ),
    ],
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF1C398E),
            Color(0xFF162456),
          ],
        ),
      ),
    ),
  );
}






