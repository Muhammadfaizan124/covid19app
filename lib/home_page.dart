import 'package:covid19app/info_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  //colors for pie chart
  final colorlist = [
    const Color(0xffde5246),
    const Color(0xff4285f4),
    const Color(0xff1aa260),
  ];
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
                dataMap: const {
                  "Death": 5,
                  "total": 20,
                  "Recovered": 15,
                },
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
