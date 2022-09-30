import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'http://corporate3.bdjobs.com/interviewtest/interviewjson.json';
  // List<Jobs> jobs = [];
  Future<Jobs>? fetchData() async {
    Response response = await _dio.get(_url);
    return Jobs.fromJson(response.data);
  }
}
