import 'package:flutter/material.dart';
import '../../../Core/utils/App_Styles.dart';
import '../../../data layer/models/book_model/book_model.dart';
import '../../reusable widgets/Book_Rating.dart';
import '../../reusable widgets/Book_image.dart';
import '../../reusable widgets/Custom_buttom_action.dart';
import '../../reusable widgets/Similar_books_listview.dart';
import 'book_details_screen_appbar.dart';

class BookDetailsScreenBody extends StatelessWidget {
  const BookDetailsScreenBody({Key? key, required this.bookModel}) : super(key: key);


   final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;


    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // AppBar
                const BookDetailsScreenAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child:  BookImage(imageUlr: bookModel.volumeInfo!.imageLinks?.thumbnail?? '',),
                ),
                const SizedBox(height: 42),
                 Text(
                  bookModel.volumeInfo!.title!,
                  style: Styles.textStyle30,
                ),
                const SizedBox(height: 6),
                Text(
                  bookModel.volumeInfo!.authors?[0] ?? '',
                  style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),

                const SizedBox(height: 18),
                 BookRating(rating: bookModel.volumeInfo!.averageRating ?? 0,
                   count: bookModel.volumeInfo!.ratingsCount ?? 2),
                const SizedBox(height: 37),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8 ),
                  child: CustomBottomAction(),
                ),

                const Expanded(child:  SizedBox(height: 37)),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',
                    style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),),
                ),

                const SizedBox(height: 16),

                const SimilarBooksListview(),
                const SizedBox(height: 40),

              ],
            ),
          ) ,
        )

      ],
    );


   /* return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // AppBar
          const BookDetailsScreenAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const BookImage(),
          ),
          const SizedBox(height: 42),
          const Text(
            'The Jangle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(height: 6),
          Text(
            'zeyad hamdy',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 18),
          const BookRating(),
          const SizedBox(height: 37),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8 ),
            child: CustomBottomAction(),
          ),

          const Expanded(child:  SizedBox(height: 37)),

          Align(
            alignment: Alignment.centerLeft,
            child: Text('You can also like',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),),
          ),

          const SizedBox(height: 16),

          const SimilarBooksListView(),
          const SizedBox(height: 40),

        ],
      ),
    );*/
  }
}
