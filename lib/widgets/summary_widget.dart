import 'package:flutter/material.dart';

import 'PieChartWidget.dart';
class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20,),
        PieChartWidget()
      ],
    );
  }
}
