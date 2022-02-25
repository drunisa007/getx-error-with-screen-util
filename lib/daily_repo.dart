import 'package:get/get.dart';
import 'package:testing_gold/api_result.dart';
import 'package:testing_gold/daily_model.dart';


import 'api_response.dart';
import 'apibase_helper.dart';

class DailyRepo{
  late ApiBaseHelper _apiBaseHelper;

  DailyRepo(){
    _apiBaseHelper = Get.put(ApiBaseHelper());
  }

  /// sample http request
  Future<ApiResult<List<DailyModel>>>  getDailyList() async {

    try {


      /// change with ur url end point.;
      dynamic data = await _apiBaseHelper.get("dailylists");
      List<DailyModel> parseData = dailyModelFromJson(data);

      return ApiResult<List<DailyModel>>(Status.eCOMPLETED, "", parseData);

    } catch (e) {

      return ApiResult<List<DailyModel>>(Status.eERROR, e.toString(),[]);

    }
  }
}