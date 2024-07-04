import 'package:flutter/material.dart';
import 'package:weather_app/model/weatherModel.dart';
class LastVisit extends StatelessWidget {
  WeatherModel? weather;
  LastVisit({super.key,required this.weather});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.15,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(weather!.cityName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 28),),
              Row(
                children: [
                  Text("Humidity: ${weather!.humidity}%",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                  SizedBox(width: 10,),
                  Text("Wind: ${weather!.windSpeed}m/s",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),

                ],
              )
            ],
          ),
          Text(weather!.temperature.toInt().toString()+"\u00B0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 48),),

        ],
      ),
    );
  }
}
