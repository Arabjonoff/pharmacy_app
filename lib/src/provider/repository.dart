import 'package:pharmacy_app/src/model/http_result.dart';
import 'package:pharmacy_app/src/provider/api_provider.dart';

class Repository{
  final ApiProvider _apiProvider  = ApiProvider();
  Future<HttpResult> register(number) => _apiProvider.register(number);
  Future<HttpResult> accept(number,code) => _apiProvider.accept(number,code);
}