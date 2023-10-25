import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data layer/repositories/home_screen_repo_implementation.dart';
import '../api service/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //  create Singleton for every repo i created

 // getIt.registerSingleton<ApiService>(ApiService(Dio()),);
 // getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
     // getIt.get<ApiService>(),
    //  ),
 // );


}
