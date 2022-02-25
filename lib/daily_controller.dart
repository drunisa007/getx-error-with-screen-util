import 'package:get/get.dart';
import 'package:testing_gold/api_response.dart';
import 'package:testing_gold/daily_model.dart';
import 'package:testing_gold/daily_repo.dart';

import 'api_result.dart';

class DailyController extends GetxController{

  late DailyRepo mRepo;

  RxList<DailyModel> mData = RxList();

  RxBool showLoading = RxBool(true);

  RxString errorMessage = RxString("");

  DailyController(){
    mRepo = Get.put(DailyRepo());
    getDailyList();
  }

  getDailyList() async {
    showLoading.value = true;

    ApiResult<List<DailyModel>> data = await mRepo.getDailyList();

    if(data.status==Status.eCOMPLETED){
      mData.addAll(data.mData);
      showLoading.value = false;
      errorMessage.value = "";
    }
    else{
      showLoading.value = false;
      errorMessage.value = data.errorMessage;
    }

  }

}