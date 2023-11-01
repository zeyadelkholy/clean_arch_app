import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../damain layer/entities/book_entity.dart';
import '../../damain layer/use_cases/fetch_featured_books_use_case.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

 // final HomeRepo homeRepo;
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await featuredBooksUseCase.call();

    // هيشوف جاله ايه وينفذه
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errorMessage));
    },

     (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}