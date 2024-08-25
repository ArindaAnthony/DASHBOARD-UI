import 'package:anthony/Data/side_menu_data.dart';
import 'package:anthony/constants/variables.dart';
import 'package:flutter/material.dart';
class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
        child: ListView.builder(
          itemCount: data.menu.length,
          itemBuilder: (context, index)=>buildMenuEntry(data, index),
        ),

    );
  }
  Widget buildMenuEntry(SideMenuData data, int index){
    final isSelected =selectedIndex ==index;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: isSelected? selectionColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: ()=>setState(() {
          selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: Icon(data.menu[index].icon,
                color: isSelected? Colors.black:Colors.grey,),
            ),
            Text(data.menu[index].title,
              style:  TextStyle(
                  fontSize: 16,
                  color: isSelected? Colors.black:Colors.grey,
                  fontWeight: isSelected? FontWeight.w600:FontWeight.normal
              ),)
          ],
        ),
      ),
    );
  }
}

