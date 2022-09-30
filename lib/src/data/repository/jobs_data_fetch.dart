import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:api_task/src/data/repository/jobs_api_implement.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Jobs>? fetchJobsData() {
    return _provider.fetchData();
  }
}
