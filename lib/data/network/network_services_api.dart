import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_coding_project/data/exception/app_exceptions.dart';
import 'package:bloc_clean_coding_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;
class NetworkServicesApi implements BaseApiServices{
  @override
  Future<dynamic> getApi(String url)async {

    dynamic jsonResponse;
    try{
      final response =  await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw FetchDataException('Time Out try again');
    }

    return jsonResponse;

  }

  @override
  Future<dynamic> postApi(String url, data) async{

    print(url);
    print(data);

    dynamic jsonResponse;
    try{
      final response =  await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw FetchDataException('Time Out try again');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException('Error communicating with server ${response.statusCode}');

      default:
        throw UnauthorisedException();
    }
  }

}