import 'package:newsapp_bloc/core/resources/data_state.dart';
import 'package:newsapp_bloc/core/usecases/usecase.dart';
import 'package:newsapp_bloc/features/daily_news/domain/entities/article.dart';
import 'package:newsapp_bloc/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void>{
  final ArticleRepository articleRepository;

  GetArticleUseCase(this.articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return articleRepository.getNewsArticle();
  }

}