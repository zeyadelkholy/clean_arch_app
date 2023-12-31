import 'dart:async';
import 'package:clean_arch_booklyapp/damain%20layer/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../Core/errors/app_failures.dart';
import '../entities/book_entity.dart';

class fetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, NoParam >{
 final HomeRepo homeRepo;

fetchFeaturedBooksUseCase(this.homeRepo);

  @override
  // param is optional parameter not required by using square practice []
  Future<Either<Failure, List<BookEntity>>> execute([int? param]) async {

    return await homeRepo.fetchFeaturedBooks();
  }


}

abstract class UseCase<Type , Param>{
  Future <Either<Failure ,Type >> execute([int param]);
}

class NoParam{}