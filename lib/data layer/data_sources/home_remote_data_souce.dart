import 'package:clean_arch_booklyapp/core/api%20service/api_service.dart';
import 'package:clean_arch_booklyapp/data%20layer/models/book_model/book_model.dart';

import '../../damain layer/entities/book_entity.dart';

abstract class HomeRemoteDataSource {

  Future< List<BookEntity>> fetchFeaturedBooks();
  Future< List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
  var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=programming');
  List<BookEntity> books =[];
  for( var bookMap in data['item']){
        books.add( BookModel.fromJson(bookMap));
  }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest& q=programming');
    List<BookEntity> books =[];
    for( var bookMap in data['item']){
      books.add( BookModel.fromJson(bookMap));
    }
    return books;
  }


}