import 'package:hive/hive.dart';

import '../../damain layer/entities/book_entity.dart';

abstract class HomeLocalDataSource {
 // class returns list of books not Future
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
   var box = Hive.box<BookEntity>('featured_box');

   // must convert collection of values into list
   return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>('newest_box');

    // must convert collection of values into list
    return box.values.toList();
  }


}