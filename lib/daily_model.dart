import 'dart:convert';

List<DailyModel> dailyModelFromJson(String str) => List<DailyModel>.from(json.decode(str).map((x) => DailyModel.fromJson(x)));

String dailyModelToJson(List<DailyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyModel {
  DailyModel({
    required this.buy,
    required this.sell,
    required this.the2D,
    required this.time,
  });

  String buy;
  String sell;
  String the2D;
  String time;

  factory DailyModel.fromJson(Map<String, dynamic> json) => DailyModel(
    buy: json["buy"],
    sell: json["sell"],
    the2D: json["2d"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "buy": buy,
    "sell": sell,
    "2d": the2D,
    "time": time,
  };
}
