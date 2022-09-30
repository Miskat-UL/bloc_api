import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/src/data/models/jobs_model.dart';

abstract class HomePageRepository {
  Future<Responses<Jobs?>> fetchJobsData(String url);
}
