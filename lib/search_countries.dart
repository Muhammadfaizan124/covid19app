import 'package:covid19app/apis.dart';
import 'package:covid19app/detail_screen.dart';
import 'package:flutter/material.dart';

class Searchcountries extends StatefulWidget {
  const Searchcountries({Key? key}) : super(key: key);

  @override
  State<Searchcountries> createState() => _SearchcountriesState();
}

class _SearchcountriesState extends State<Searchcountries> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Search with country name",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchCountries(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Loading....");
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]["country"];
                      if (controller.text.isEmpty) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        image: snapshot.data![index]
                                            ["countryInfo"]["flag"],
                                        name: snapshot.data![index]["country"],
                                        totalCases: snapshot.data![index]
                                            ["cases"],
                                        totalRecovered: snapshot.data![index]
                                            ["recovered"],
                                        totalDeaths: snapshot.data![index]
                                            ["deaths"],
                                        active: snapshot.data![index]["active"],
                                        test: snapshot.data![index]["test"],
                                        todayRecovered: snapshot.data![index]
                                            ["todayRecovered"],
                                        critical: snapshot.data![index]
                                            ["critical"],
                                      )),
                            );
                          },
                          child: ListTile(
                            title: Text(snapshot.data![index]["country"]),
                            subtitle:
                                Text(snapshot.data![index]["cases"].toString()),
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                snapshot.data![index]["countryInfo"]["flag"],
                              ),
                            ),
                          ),
                        );
                      } else if (name.toLowerCase().contains(
                            controller.text.toLowerCase(),
                          )) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        image: snapshot.data![index]
                                            ["countryInfo"]["flag"],
                                        name: snapshot.data![index]["country"],
                                        totalCases: snapshot.data![index]
                                            ["cases"],
                                        totalRecovered: snapshot.data![index]
                                            ["recovered"],
                                        totalDeaths: snapshot.data![index]
                                            ["deaths"],
                                        active: snapshot.data![index]["active"],
                                        test: snapshot.data![index]["test"],
                                        todayRecovered: snapshot.data![index]
                                            ["todayRecovered"],
                                        critical: snapshot.data![index]
                                            ["critical"],
                                      )),
                            );
                          },
                          child: ListTile(
                            title: Text(snapshot.data![index]["country"]),
                            subtitle:
                                Text(snapshot.data![index]["cases"].toString()),
                            leading: Image(
                              height: 50,
                              width: 50,
                              image: NetworkImage(
                                snapshot.data![index]["countryInfo"]["flag"],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
