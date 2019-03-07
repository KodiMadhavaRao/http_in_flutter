import 'package:dio/dio.dart';
import 'package:dio_http/network/response_parsing.dart';
class DioUtil{

  static Future get() async{
    Dio dio = new Dio();
    var url = "https://randomuser.me/api/?results=50";
    var response = await dio.get(url);
    return  parseJson.responseparser(response.data);
  }
}