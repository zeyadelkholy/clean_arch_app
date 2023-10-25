import 'package:clean_arch_booklyapp/damain%20layer/entities/book_entity.dart';

abstract class HomeRepo{

  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();


}