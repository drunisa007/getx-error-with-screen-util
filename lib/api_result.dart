
import 'api_response.dart';

class ApiResult<T> {
  Status status;
  String errorMessage;
  T mData;

  ApiResult(this.status, this.errorMessage, this.mData);
}