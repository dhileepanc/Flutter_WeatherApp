
import 'package:flutter/material.dart';
import 'package:flutter_firebase2/model/weather_model.dart';
import 'package:flutter_firebase2/screens/additional_information.dart';
import 'package:flutter_firebase2/screens/current_weather.dart';
import 'package:flutter_firebase2/service/weather_api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  String? location='Madurai';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Future<void> GetData() async{
    data = await client.GetCurrentWeather("${location}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,

      ),
      body: FutureBuilder(future: GetData(),
    builder:(context,snapshot){

        if(snapshot.connectionState==ConnectionState.done){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CurrentWeather(Icons.wb_sunny_rounded, '${data!.temp}°', '${data!.cityName}'),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Additional Information',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(
                height: 20.0,
              ),
              AdditionalInformation('${data!.wind}', '${data!.humidity}', '${data!.pressure}', '${data!.feels_like}'),
            ],
          );
        }
         return Container();
    }
    )
    );
  }
}
