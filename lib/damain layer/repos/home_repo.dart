import 'package:clean_arch_booklyapp/damain%20layer/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../Core/errors/app_failures.dart';

abstract class HomeRepo{

  Future<Either< Failure , List<BookEntity>>> fetchFeaturedBooks();
  Future<Either< Failure , List<BookEntity>>> fetchNewestBooks();

}