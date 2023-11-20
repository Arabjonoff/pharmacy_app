import 'package:pharmacy_app/src/model/banner.dart';
import 'package:pharmacy_app/src/model/http_result.dart';
import 'package:pharmacy_app/src/provider/repository.dart';
import 'package:rxdart/rxdart.dart';

class BannerBloc{
  final Repository _repository = Repository();
  final _fetchBannerInfo = PublishSubject<BannerModel>();
  Stream<BannerModel> get getBannerStream => _fetchBannerInfo.stream;

  getAllBanner()async{
    HttpResult response = await _repository.getBanner();
    if(response.isSuccess){
      var data = BannerModel.fromJson(response.result);
      _fetchBannerInfo.sink.add(data);
    }
  }

}

final bannerBloc = BannerBloc();