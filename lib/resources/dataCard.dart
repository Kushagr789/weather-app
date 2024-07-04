import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
class DataCard extends StatelessWidget {
  final String heading;
  final IconData icons;
  final String unit;
  final String data;
  DataCard({super.key, required this.heading, required this.icons, required this.unit, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey
          ),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          child: Row(

            children: [
              Icon(icons,color: Colors.white,size: 16,),
              SizedBox(width: 10,),
              Text(heading,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
            ],
          ),
        ),
        Row(
          children: [
            Text(data,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 24),),
            SizedBox(width: 10,),
            Text(unit,style: TextStyle(color: Colors.white38,fontWeight: FontWeight.w600,fontSize: 24),),
          ],
        )
      ],
    );
  }
}
