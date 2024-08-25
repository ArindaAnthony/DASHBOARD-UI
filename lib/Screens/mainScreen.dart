import 'package:anthony/widgets/dashboard_widget.dart';
import 'package:anthony/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/summary_widget.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Row(
        children: [
          const Expanded(
              flex: 2,
             child: SizedBox(
              // color: Colors.red,
               child: SideMenuWidget(),
             ), ),
          const Expanded(
            flex: 7,
            child: DashboardWidget(), ),
          Expanded(
            flex: 3,

            child: Container(
              color: Colors.green,
              child: const SummaryWidget(),
            ), ),
        ],
      )),
    );
  }
}
