import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testing_gold/daily_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DailyController mController = Get.put(DailyController());

    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          return mController.showLoading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: mController.mData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      width: 0.22.sh,
                      height: 0.1.sh,
                      padding: const  EdgeInsets.all(10),
                      child: Text(mController.mData[index].time,style: TextStyle(
                        fontSize: 20.sp
                      ),),
                    );
                  });
        }));
  }
}
