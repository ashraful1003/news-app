import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final dynamic content;

  const ArticleEntity(
      {this.id,
      this.title,
      this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
