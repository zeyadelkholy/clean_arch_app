import 'package:dartz/dartz.dart';
import '../../Core/errors/app_failures.dart';
import '../models/book_model/book_model.dart';


abstract class HomeRepo
{
  // two functions in home screen

Future<Either< Failure , List<BookModel> >> fetchBooks();
Future<Either< Failure , List<BookModel> >> fetchNewestBooks();
Future<Either< Failure , List<BookModel> >> fetchSimilarBooks({required String category });

}