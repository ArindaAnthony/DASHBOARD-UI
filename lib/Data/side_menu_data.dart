import 'package:anthony/Models/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData{
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: "DashBoard"),
    MenuModel(icon: Icons.person, title: "Profile"),
    MenuModel(icon: Icons.run_circle, title: "Exercise"),
    MenuModel(icon: Icons.settings, title: "Settings"),
    MenuModel(icon: Icons.history, title: "History"),
    MenuModel(icon: Icons.logout, title: "SignOut"),
  ];
}