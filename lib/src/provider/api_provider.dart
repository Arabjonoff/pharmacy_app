import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pharmacy_app/src/model/http_result.dart';

String _baseUrl = 'https://api.gopharm.uz/api/v1/';

class ApiProvider {
  _postRequest(String url, body) async {
    http.Response request =
        await http.post(Uri.parse(url), body: body, headers: {});
    if (request.statusCode >= 200 && request.statusCode < 300) {
      print(request.body);
      return HttpResult(
        statusCode: request.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(request.bodyBytes)),
      );
    }
  }

  _getRequest(url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    }
  }

  Future<HttpResult> register(number) async {
    String url = '${_baseUrl}register';
    var body = {
      "login": number,
    };
    return await _postRequest(url, body);
  }

  Future<HttpResult> accept(number, code) async {
    String url = '${_baseUrl}accept';
    var body = {
      "login": number,
      "smscode": code,
    };
    print(body);
    return await _postRequest(url, body);
  }

  Future<HttpResult> getBanner()async{
    String url = '${_baseUrl}sales/';
    print(url);
    return await _getRequest(url);
  }
  Future<HttpResult> getDurgs()async{
    String url = '${_baseUrl}drugs';
    print(url);
    return await _getRequest(url);
  }
  Future<HttpResult> getPages()async{
    String url = '${_baseUrl}pages';
    print(url);
    return await _getRequest(url);
  }
}
