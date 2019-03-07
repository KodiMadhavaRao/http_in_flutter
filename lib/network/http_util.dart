import 'dart:convert' as convert;
import 'package:dio_http/dto/users.dart';
import 'package:dio_http/network/response_parsing.dart';
import 'package:http/http.dart' as http;

class httpUtil {
  static Object getRandomUsers() async {
    var url = "https://randomuser.me/api/?results=50";
    var response = await http.get(url);
    var jsonResponse;
    if (response.statusCode == 200) {
      jsonResponse= convert.jsonDecode(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    return parseJson.responseparser(jsonResponse);
  }
}
