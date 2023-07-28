import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp_bloc/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:newsapp_bloc/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:newsapp_bloc/features/daily_news/domain/repository/article_repository.dart';
import 'package:newsapp_bloc/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:newsapp_bloc/features/daily_news/representation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializedDependencies() async {
  /// dio
  sl.registerSingleton<Dio>(Dio());

  /// dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  /// usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  ///blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
