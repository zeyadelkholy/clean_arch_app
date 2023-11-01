import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data layer/data_sources/home_local_data_source.dart';
import '../../data layer/data_sources/home_remote_data_souce.dart';
import '../../data layer/repositories/home_screen_repo_implementation.dart';
import '../api service/api_service.dart';



final getIt = GetIt.instance;

void serviceLocator() {

  getIt.registerSingleton<ApiService>(
      ApiService(Dio as Dio),
  );



  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        getIt.get<ApiService>()
      ),

      homeLocalDataSource: HomeLocalDataSourceImplementation(),
    ),
  );
}




