// ignore_for_file: file_names

import 'package:clean_arch_booklyapp/Core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../data layer/models/book_model/book_model.dart';
import '../../data layer/repositories/home_screen_repo_implementation.dart';
import '../../presentation layer/book details screen/book_details_screen.dart';
import '../../presentation layer/home screen/home_screen.dart';
import '../../presentation layer/search screen/search_screen.dart';
import '../../presentation layer/splash screen/splash_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        // بحدد اول اسكرين بناءا علي علامه الاسلاش (/)
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/HomeScreen',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/BookDetailsScreen',
        // add extra data with book model
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsScreen(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: '/SearchScreen',
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
