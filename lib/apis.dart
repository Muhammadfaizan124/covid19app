import 'dart:convert';

import 'package:http/http.dart' as http;

class AppUrl {
  static const String mainUrl = 'https://disease.sh/v3/covid-19/';
  static const String worldStates = mainUrl + "all";
  static const String countriesStates = mainUrl + "countries";
}

Future<List<dynamic>> fetchCountries() async {
  try {
    final response = await http.get(Uri.parse(AppUrl.countriesStates));
    if (response.statusCode == 200) {
      // Parse the JSON response and return the data
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load countries');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
