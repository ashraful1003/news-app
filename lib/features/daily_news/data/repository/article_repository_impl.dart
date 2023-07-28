import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsapp_bloc/core/constants/constants.dart';
import 'package:newsapp_bloc/core/resources/data_state.dart';
import 'package:newsapp_bloc/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:newsapp_bloc/features/daily_news/data/models/article_model.dart';
import 'package:newsapp_bloc/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;

  ArticleRepositoryImpl(this.newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        category: categoryQuery,
        country: countryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      // TODO
      return DataFailed(e);
    }
  }
}
