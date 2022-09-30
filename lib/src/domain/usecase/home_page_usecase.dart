import 'package:api_task/src/domain/repository/home_page_repository.dart';

abstract class HomePageUseCase {
  final HomePageRepository homePageRepository;
  HomePageUseCase(this.homePageRepository);
}
