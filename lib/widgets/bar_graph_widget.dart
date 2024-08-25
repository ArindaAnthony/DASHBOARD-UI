import 'package:anthony/Data/bar_graph_data.dart';
import 'package:anthony/widgets/customCard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Models/graph_model.dart';
class BarGraphWidget extends StatelessWidget {
  const BarGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bar = BarGraphData();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 15,
        childAspectRatio: 5/4
      ),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: bar.data.length,
      itemBuilder: (context, index){
        return Customcard(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bar.data[index].label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12,),
                 Expanded(
                    child: BarChart(
                      BarChartData(
                        barGroups: _chartGroups(
                            points: bar.data[index].graph,
                            color: bar.data[index].color,
                        ),
                        borderData: FlBorderData(border: const Border()),
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, widget){
                                return Padding(padding: EdgeInsets.all(5),
                                child: Text(
                                  bar.label[value.toInt()],
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                );
                              },
                            )
                          ),
                          leftTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                          )
                        ),
                          rightTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              )
                          ),
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              )
                          ),
                      )
                    )))
              ],
            ),
          ),
        );
      },
    );
  }


List<BarChartGroupData> _chartGroups(
    {required List<GraphModel> points, required Color color}) {
  return points
      .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
    BarChartRodData(
      toY: point.y,
      width: 12,
      color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(3.0),
        topRight: Radius.circular(3.0),
      ),
    )
  ]))
      .toList();
}}

