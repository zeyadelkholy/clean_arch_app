import 'package:clean_arch_booklyapp/bloc/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_booklyapp/bloc/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_booklyapp/core/utils/simple_bloc_observer.dart';
import 'package:clean_arch_booklyapp/damain%20layer/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_booklyapp/damain%20layer/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_booklyapp/data%20layer/repositories/home_screen_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Core/utils/service_locator.dart';
import 'core/utils/App_router.dart';
import 'damain layer/entities/book_entity.dart';

void main() async {

  await Hive.initFlutter;
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('featured_box');
  await Hive.openBox<BookEntity>('newest_box');
  // to call the register Singleton from service locator

  setupServiceLocator();

  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

/*
final getIt = GetIt.instance;
void ServiceLocator() {
   getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImplementation(
        ApiService(Dio as Dio),
      ),
      homeLocalDataSource: HomeLocalDataSourceImplementation(),
    ),
  );
}*/




class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                // نسخه واحده استخدمها فاكتر من مكان
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100B20),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
