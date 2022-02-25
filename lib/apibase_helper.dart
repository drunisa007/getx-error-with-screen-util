import 'dart:io';

import 'package:http/http.dart' as http;


part 'app_exception.dart';

class ApiBaseHelper   {
  // replace your base url here
  final String _baseUrl = ""; // initialize api url

  // get method for api call
  Future<dynamic> get(String uri) async {
    dynamic responseJson;
    try {
      var url = Uri.parse(_baseUrl + uri);
      final response = await http.get(url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // handing different response
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response
                .statusCode}');
    }
  }

  ///submit example
  //await http.post(url, headers: getHeader(), body: jsonEncode(body));

  // handing with header
  dynamic getHeader() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer "
    };
  }

}