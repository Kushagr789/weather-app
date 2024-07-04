import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weatherModel.dart';
import 'package:weather_app/viewModel/weatherViewModel.dart';

class MainData extends StatelessWidget {
  WeatherViewModel viewModel;
   MainData({super.key,required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: size.width*0.5,
          child: Text(capitalizeEachWord(viewModel.weather!.weatherCondition),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 30),),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.network('http://openweathermap.org/img/w/${viewModel.weather!.weatherIcon}.png',fit: BoxFit.cover,),
              width: size.width*0.4,
              height: size.height*0.15,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
            Container(
              child: Text(viewModel.weather!.temperature.toInt().toString()+"\u00B0",
                style: TextStyle(color: Colors.white,fontSize: 100,fontWeight: FontWeight.w500),
              ),
              width: size.width*0.4,
              height: size.height*0.15,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 50),
          child: Align(alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("/ Real Feel",style: TextStyle(color: Colors.white60,fontWeight: FontWeight.w500,fontSize: 16)),
                Text(viewModel.weather!.realFeel.toInt().toString()+"\u00B0",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18)),
              ],
            ),),
        ),
      ],
    );
  }
}
String capitalizeEachWord(String text) {
  if (text.isEmpty) return text;
  return text.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}