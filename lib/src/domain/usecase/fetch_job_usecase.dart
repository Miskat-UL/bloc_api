import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/src/data/models/jobs_model.dart';
import 'package:api_task/src/domain/repository/home_page_repository.dart';
import 'package:api_task/src/domain/usecase/home_page_usecase.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class FetchJobUseCase extends HomePageUseCase {
  FetchJobUseCase(HomePageRepository homePageRepository)
      : super(homePageRepository);

  Future<Responses<Jobs?>> fetchData(String url) async {
    // final _provider = ApiProvider();
    var response = await homePageRepository.fetchJobsData(url);


    if (response.status == Status.success) {
      response = Responses.success(response.data);
    }
    else if(response.status == Status.failed){
      return Responses.failed();
    }

    return Responses.success(response.data);
    // return response!;
    // final Dio _dio = Dio();
    // List<Jobs> jobs = [];
    // Response response = await _dio.get(url);
    // return Jobs.fromJson(response.data);
  }
}
