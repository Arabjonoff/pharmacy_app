import 'package:pharmacy_app/src/model/http_result.dart';
import 'package:pharmacy_app/src/model/pages_model.dart';
import 'package:pharmacy_app/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class PagesBloc {
  final Repository _repository = Repository();
  final fetchPagesInfo = PublishSubject<PagesModel>();

  Stream<PagesModel> get getPageStream => fetchPagesInfo.stream;

  getAllPages() async {
    HttpResult result = await _repository.getPages();
    if (result.isSuccess) {
      var data = PagesModel.fromJson(result.result);
      fetchPagesInfo.sink.add(data);
    }
  }
}

final pageBloc = PagesBloc();
