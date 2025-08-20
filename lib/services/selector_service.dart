import 'dart:convert';
import 'package:dropdown_test/models/country.dart';
import 'package:dropdown_test/models/state.dart';
import 'package:http/http.dart' as http;

class SelectorService {
  static const String BASIC_URL = '68a2b00ac5a31eb7bb1d7ad2.mockapi.io';

  Uri _getUrl(String path) {
    return Uri.parse('https://$BASIC_URL/api/v1/$path');
  }

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(_getUrl('countries'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<StateModel>> fetchStates(String countryId) async {
    final response = await http.get(_getUrl('countries/$countryId/states'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => StateModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load states');
    }
  }
}
