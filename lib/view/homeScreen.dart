

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/resources/lastVisit.dart';
import 'package:weather_app/view/weatherScreen.dart';

import '../viewModel/weatherViewModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherViewModel>().loadLastSearchedCity();
    });
  }
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,backgroundColor: Colors.blue.shade200,elevation: 5,
        title: Text('Weather App',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.blue.shade200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height*0.1,),
                Text("Welcome to my Weather App",textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 36,fontWeight: FontWeight.w600,),
                ),
                SizedBox(height: size.height*0.05,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.black,fontSize: 18),
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      border: InputBorder.none,
                    ),

                  ),
                ),
                SizedBox(height: size.height*0.05,),
                InkWell(
                  onTap: (){
                    final cityName = _controller.text;
                    if (cityName.isNotEmpty) {
                      context.read<WeatherViewModel>().fetchWeather(cityName);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherScreen()));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("Get Weather",style: TextStyle(color: Colors.black,fontSize: 18),),
                  ),
                ),
                SizedBox(height: size.height*0.1,),
                Consumer<WeatherViewModel>(
                  builder: (context, viewModel, child) {
                    if (viewModel.isLoading) {
                      return CircularProgressIndicator();
                    } else if (viewModel.errorMessage != null) {
                      return Text(viewModel.errorMessage!);
                    } else if (viewModel.weather != null) {
                      return LastVisit(weather: viewModel.weather);
                    } else {
                      return Container();
                    }
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
