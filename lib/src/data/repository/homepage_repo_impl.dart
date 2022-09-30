import 'dart:convert';

import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:api_task/src/domain/repository/home_page_repository.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePageRepoImp implements HomePageRepository {
  final Dio _dio = Dio();

  @override
  Future<Responses<Jobs?>> fetchJobsData(String url) async {
    // List<Jobs> jobs = [];
    var connectivity = await (Connectivity().checkConnectivity());
    if (connectivity == ConnectivityResult.none){

      return Responses.failed();
      // return Responses.success(Jobs.fromJson(response.data));
    }
    Response response = await _dio.get(url);
    // return Responses.failed();
    return Responses.success(Jobs.fromJson(response.data));

  }
}
