import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/resources/dataCard.dart';
import 'package:weather_app/resources/mainData.dart';
import 'package:weather_app/services/getWeatherType.dart';
import 'package:weather_icons/weather_icons.dart';
import '../viewModel/weatherViewModel.dart';
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<WeatherViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return CircularProgressIndicator();
          } else if (viewModel.errorMessage != null) {
            return Text(viewModel.errorMessage!);
          } else if (viewModel.weather != null) {
            return Stack(
              children: [
                WeatherBg(weatherType: GetWeatherType.getWeatherType(viewModel.weather!.weatherCondition), width: size.width, height: size.height),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  color: Colors.black.withOpacity(0.2),
                  height: size.height,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(viewModel.weather!.cityName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 36),),
                      Container(width: size.width*0.45,height: 3,color: Colors.white38,),
                      MainData(viewModel: viewModel),
                      Container(width: size.width,height: 1,color: Colors.white38,margin: EdgeInsets.symmetric(vertical: 20),),
                      Container(
                        width: size.width,
                        height: size.height*0.28,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DataCard(heading: "Wind", icons: WeatherIcons.strong_wind, unit: "m/s", data: viewModel.weather!.windSpeed.toStringAsFixed(1)),
                                DataCard(heading: "Humidity", icons: WeatherIcons.humidity, unit: "%", data: viewModel.weather!.humidity.toString()),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DataCard(heading: "UV Index", icons: WeatherIcons.dust, unit: "", data: "3"),
                                DataCard(heading: "Pressure", icons: WeatherIcons.barometer, unit: "hpa", data: viewModel.weather!.pressure.toString()),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(width: size.width,height: 1,color: Colors.white38,margin: EdgeInsets.symmetric(vertical: 15),),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(40),
                            ),

                            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                            child: Text("Refresh",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w600),),
                          ),
                          onTap: (){
                            context.read<WeatherViewModel>().fetchWeather(viewModel.weather!.cityName);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}


