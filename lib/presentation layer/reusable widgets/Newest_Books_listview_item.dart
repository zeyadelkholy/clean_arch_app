// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../Core/utils/App_Styles.dart';
import '../../Core/utils/constants.dart';
import '../../data layer/models/book_model/book_model.dart';
import 'Book_Rating.dart';
import 'Book_image.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/BookDetailsScreen', extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            BookImage(
                imageUlr: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: GtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo!.authors![0],
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating:
                            bookModel.volumeInfo!.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo!.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
