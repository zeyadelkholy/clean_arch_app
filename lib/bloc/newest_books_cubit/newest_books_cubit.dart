import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data layer/models/book_model/book_model.dart';
import '../../data layer/repositories/home_screen_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {

    emit(NewestBooksLoading());

    var result = await homeRepo.fetchNewestBooks();
    // result have 2 cases (left,right)
    result.fold(
          (failure) {
        emit(NewestBooksFailure(failure.errorMessage));
      },

          (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }





}
