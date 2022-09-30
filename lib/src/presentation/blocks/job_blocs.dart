import 'package:api_task/core/data/models/api_response_model.dart';
import 'package:api_task/core/di/app_components.dart';

import 'package:api_task/src/data/repository/homepage_repo_impl.dart';
import 'package:api_task/src/data/repository/jobs_api_implement.dart';
import 'package:api_task/src/domain/repository/home_page_repository.dart';
import 'package:api_task/src/domain/usecase/fetch_job_usecase.dart';
import 'package:api_task/src/presentation/blocks/job_event.dart';
import 'package:api_task/src/presentation/blocks/job_state.dart';
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  // final locator = GetIt.instance;

  JobBloc() : super(JobInitial()) {
    // final ApiRepository _apiRepository = ApiRepository();
    // final Dio _dio = Dio();
    // HomePageRepository? homePageRepository;
    final FetchJobUseCase fetchJobUseCase =
        FetchJobUseCase(locator<HomePageRepository>());
    final _provider = ApiProvider();
    on<GetJobList>((event, emit) async {
      final mList = await fetchJobUseCase.fetchData(
          'http://corporate3.bdjobs.com/interviewtest/interviewjson.json');


      try {
        if(mList.status == Status.failed){
          emit(const JobError("Failed to fetch data.No internet connection?"));
        }else {
          emit(JobLoading());
          // final mList = await _apiRepository.fetchJobsData();
          // final mList = await _provider.fetchData();
          // if(mList.status == "")

          emit(JobsLoaded(mList));
          // if (mList.error != null) {
          //   emit(JobError(mList.error));
          // }
        }
      } catch (e) {
        emit(const JobError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
