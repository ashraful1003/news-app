import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp_bloc/features/daily_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  ArticleTile({super.key, this.articles});

  ArticleEntity? articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14),
      height: MediaQuery.of(context).size.height / 4,
      child: Row(
        children: [_buildImage(context), _buildTitleAndDescription()],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: articles!.urlToImage!,
      imageBuilder: (context, imageProvider) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.sizeOf(context).width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
              child: const CupertinoActivityIndicator(),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.sizeOf(context).width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.08)),
              child: const CupertinoActivityIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Text(
            articles!.title ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87),
          ),

          /// description
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(articles!.description ?? '', maxLines: 2),
          )),

          /// date time
          Row(
            children: [
              Icon(Icons.timeline_outlined, size: 16),
              SizedBox(width: 4),
              Text(
                articles!.publishedAt!.toString(),
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
