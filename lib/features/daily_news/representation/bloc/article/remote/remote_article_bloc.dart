import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_bloc/core/resources/data_state.dart';

import 'package:newsapp_bloc/features/daily_news/representation/bloc/article/remote/remote_article_event.dart';
import 'package:newsapp_bloc/features/daily_news/representation/bloc/article/remote/remote_article_state.dart';

import '../../../../domain/usecases/get_article_use_case.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase getArticleUseCase;

  RemoteArticlesBloc(this.getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.exception!));
    }
  }
}
