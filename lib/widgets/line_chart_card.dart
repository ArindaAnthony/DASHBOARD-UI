import 'package:anthony/constants/variables.dart';
import 'package:anthony/widgets/customCard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Data/line_chart_data.dart';
class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data =LineData();
    return   Customcard(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Steps OverView", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
        const SizedBox(height: 20,),
        AspectRatio(aspectRatio: 16/6,
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(handleBuiltInTouches: true),
            gridData: const FlGridData(show: false),
            titlesData:  FlTitlesData(
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true,
                getTitlesWidget: (double v, TitleMeta meta){
                  return data.bottomTitle[v.toInt()]!=null? SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        data.bottomTitle[v.toInt()].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                      )):const SizedBox();
                }),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true,
                    interval: 1,
                    reservedSize: 40,
                    getTitlesWidget: (double v, TitleMeta meta){
                      return data.leftTitle[v.toInt()]!=null? SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                              data.leftTitle[v.toInt()].toString(),
                            style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                          )):const SizedBox();
                    },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                  color: selectionColor,
                belowBarData: BarAreaData(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      selectionColor.withOpacity(0.5),
                      Colors.transparent
                    ]
                  ),
                  show: true
                ),
                dotData: const FlDotData(show: false),
                spots: data.spots,
              )
            ],
            minX: 0,
            maxX: 120,
            minY: -5,
            maxY: 105
          )
        ),)
      ],
    ));
  }
}
