
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Core/utils/App_Styles.dart';
import '../../Core/utils/constants.dart';
import '../../data layer/models/book_model/book_model.dart';
import 'Book_Rating.dart';
import 'Book_image.dart';

class BookListViewItem extends StatefulWidget {
  const BookListViewItem({Key? key, required this.bookModel}) : super(key: key);

  final BookModel bookModel;

  @override
  State<BookListViewItem> createState() => _BookListViewItemState();
}

class _BookListViewItemState extends State<BookListViewItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/BookDetailsScreen');
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            //  AspectRatio(
            // aspectRatio: 2.5 / 4,
            //  child: Container(
            //  decoration: BoxDecoration(
            //    borderRadius: BorderRadius.circular(8),
            //    color: Colors.red,
            //    image: const DecorationImage(
            //       fit: BoxFit.fill,
            //  image: AssetImage('assets/images/test_image.png'),
            //    ),
            //  ),
            // ),
            //  ),

            BookImage(
                imageUlr: widget.bookModel.volumeInfo!.imageLinks!.thumbnail),
            const SizedBox(width: 30),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(widget.bookModel.volumeInfo!.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: GtSectraFine)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.bookModel.volumeInfo!.authors![0],
                    style:
                        Styles.textStyle14.copyWith(fontFamily: GtSectraFine),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // rating part
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: widget.bookModel.volumeInfo!.averageRating ?? 0,
                        count: widget.bookModel.volumeInfo!.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
