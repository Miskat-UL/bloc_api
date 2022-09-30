import 'package:api_task/src/data/repository/homepage_repo_impl.dart';
import 'package:api_task/src/domain/repository/home_page_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class AppComponents {
  Future<void> init() async {
    locator.registerFactory<HomePageRepository>(() => HomePageRepoImp());
    // locator.registerFactory<HomePageRepository>(() => HomePageRepoImp());
  }
}
