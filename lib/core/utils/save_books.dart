import 'package:hive/hive.dart';

import '../../damain layer/entities/book_entity.dart';

void saveboxData(List<BookEntity> books , String boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}