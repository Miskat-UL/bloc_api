import 'package:dio/dio.dart';

class Responses<T> {
  Status? status;
  T? data;

  Responses.loading() : status = Status.loading;
  Responses.success(this.data) : status = Status.success;
  Responses.failed() : status = Status.failed;
}

enum Status {
  success,

  failed,
  loading,
  validation,
}
