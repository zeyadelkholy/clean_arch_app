import 'package:clean_arch_booklyapp/core/errors/app_failures.dart';
import 'package:clean_arch_booklyapp/damain%20layer/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../Core/errors/app_failures.dart';
import '../entities/book_entity.dart';

class fetchFeaturedBooksUseCase {
final HomeRepo homeRepo;
fetchFeaturedBooksUseCase(this.homeRepo);


Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
  return homeRepo.fetchFeaturedBooks();




  }
}