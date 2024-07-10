import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restapi/models/CovidAppModel/world.dart';
import 'package:restapi/services/utils/app_urls.dart';

class StatsServies {
  Future<WorldStatesModel> fetchdata() async {
    final response = await http.get(Uri.parse(AppUrl.baseUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
