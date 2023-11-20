import 'package:pharmacy_app/src/model/durgs_model.dart';
import 'package:pharmacy_app/src/model/http_result.dart';
import 'package:pharmacy_app/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class DurgBloc{
  final Repository _repository = Repository();
  final _fetchDrugInfo = PublishSubject<DrugsModel>();
  Stream<DrugsModel> get getDrugStream => _fetchDrugInfo.stream;

  getAllDurgs()async{
    HttpResult result = await _repository.getDurgs();
    if(result.isSuccess){
      var data = DrugsModel.fromJson(result.result);
      _fetchDrugInfo.sink.add(data);
    }
  }

}
final drugsBloc= DurgBloc();