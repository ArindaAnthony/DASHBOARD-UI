import 'package:anthony/Data/health_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customCard.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthDetails = HealthDetails();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: healthDetails.healthData.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 15, mainAxisSpacing: 12),
        itemBuilder: (BuildContext context, int index) => Customcard(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                healthDetails.healthData[index].icon,
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 3),
                child: Text(
                  healthDetails.healthData[index].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails.healthData[index].title,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
