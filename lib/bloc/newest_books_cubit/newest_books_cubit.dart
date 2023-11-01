import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../damain layer/entities/book_entity.dart';
import '../../damain layer/use_cases/fetch_newest_books_use_case.dart';
part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit( this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(NewestBooksLoading());

    var result = await fetchNewestBooksUseCase.call();

    // هيشوف جاله ايه وينفذه
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    },

            (books) {
          emit(NewestBooksSuccess(books));
        });
  }





}
