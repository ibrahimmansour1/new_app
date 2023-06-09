import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/models/news_model/news_model.dart';
import 'package:news_app/core/repo/home_repo.dart';

part 'top_headlines_state.dart';

class TopHeadlinesCubit extends Cubit<TopHeadlinesState> {
  TopHeadlinesCubit(this.homeRepo) : super(TopHeadlinesInitial());

  final HomeRepo homeRepo;
  Future<void> fetchBreakingNews() async {
    emit(TopHeadlinesLoading());
    var result = await homeRepo.fetchBreakingNews();
    result.fold((failure) {
      emit(TopHeadlinesFailure(failure.errMessage));
    }, (news) {
      emit(TopHeadlinesSuccess(news));
    });
  }
}
