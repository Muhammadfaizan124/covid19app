import 'dart:convert';

import 'package:covid19app/info_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  final Map<String, double> dataMap = {
    "deaths": 0,
    "total": 0,
    "recovered": 0,
  };
  //colors for pie chart
  final colorlist = [
    const Color(0xffde5246),
    const Color(0xff4285f4),
    const Color(0xff1aa260),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://covid-193.p.rapidapi.com/statistics'),
        headers: {
          'X-RapidAPI-Key':
              'c3c281ff1bmshd11d11a6801cb1fp16a710jsnd79fcdb3f7fe',
          'X-RapidAPI-Host': 'covid-193.p.rapidapi.com',
        },
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Extracting data
        final List<dynamic> countriesData = responseData['response'];
        final Map<String, dynamic> firstCountryData = countriesData.first;
        final Map<String, dynamic> casesData = firstCountryData['cases'];
        // Updating dataMap
        setState(() {
          dataMap['deaths'] =
              double.parse(casesData['deaths']['total'].toString());
          dataMap['total'] = double.parse(casesData['total'].toString());
          dataMap['recovered'] =
              double.parse(casesData['recovered']['total'].toString());
        });
      } else {
        // Handle error when fetching data
        print('Failed to load data');
      }
    } catch (error) {
      // Handle error when making HTTP request
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              PieChart(
                dataMap: dataMap,
                chartRadius: MediaQuery.of(context).size.width / 2.2,
                animationDuration: const Duration(seconds: 5),
                colorList: colorlist,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Card(
                  child: Column(
                    children: [
                      InfoRow(title: "death", value: "200"),
                      InfoRow(title: "death", value: "200"),
                      InfoRow(title: "death", value: "200"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(screenWidth * 1.0, screenHeight * 0.09),
                        ),
                        child: const Text(
                          "search countries",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
