import 'package:current_location/current_location.dart';
// import "package:current_location/model/location.dart";
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'current location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'current location'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: UserLocation.getValue(),
        builder: (BuildContext context, dynamic snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Country: ${snapshot.data!.country}'),
                  Text('Country Code: ${snapshot.data!.countryCode}'),
                  Text('Region: ${snapshot.data!.region}'),
                  Text('Region Name: ${snapshot.data!.regionName}'),
                  Text('Timezone: ${snapshot.data!.timezone}'),
                  Text('Latitude: ${snapshot.data!.latitude}'),
                  Text('Longitude: ${snapshot.data!.longitude}'),
                  Text('ISP: ${snapshot.data!.isp}'),
                  Text('Current IP: ${snapshot.data!.currentIP}'),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}