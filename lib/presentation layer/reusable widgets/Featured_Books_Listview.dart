// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/featured_books_cubit/featured_books_cubit.dart';
import '../../damain layer/entities/book_entity.dart';
import 'Book_image.dart';
import 'custom_error_message.dart';

class FeaturedBookListView extends StatefulWidget {
  const FeaturedBookListView({Key? key, required this.books}) : super(key: key);

   final List<BookEntity> books;

  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
 final ScrollController scrollController = ScrollController();

 @override
 void initState(){
   super.initState();
   scrollController.addListener(scrollController as VoidCallback);
 }

 // هيجيب الداتا لما اوصل ل 70% من الكتب اللي عندي
 void scrollListener(){
   var currentPosition = scrollController.position.pixels;
   var maxScrollLength = scrollController.position.maxScrollExtent;
   if (currentPosition>= 0.7* maxScrollLength)
   {
     BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();

   }
 }


 @override
 void dispose(){
   scrollController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              controller:scrollController ,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/BookDetailsScreen',
                          extra: state.books[index]);
                    },
                    child: BookImage(
                        imageUlr: widget.books[index].image ?? ''),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
