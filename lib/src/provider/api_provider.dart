import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacy_app/src/model/http_result.dart';

String _baseUrl = 'https://api.gopharm.uz/api/v1/';

class ApiProvider {
  _postRequest(String url, body) async {
    http.Response request = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
      }
    );
    if (request.statusCode >= 200 && request.statusCode < 300) {
      print(request.body);
      return HttpResult(
        statusCode: request.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(request.bodyBytes)),
      );
    }
  }

  Future<HttpResult> register(number)async{
    String url = '${_baseUrl}register';
    var body = {
      "login": number,
    };
    return await _postRequest(url, body);
  }
  Future<HttpResult> accept(number,code)async{
    String url = '${_baseUrl}accept';
    var body = {
      "login": number,
      "smscode": code,
    };
    print(body);
    return await _postRequest(url, body);
  }
}

