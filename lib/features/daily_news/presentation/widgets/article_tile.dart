import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleTile({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(children: [_buildImage(context), _buildContent()]),
    );
  }

  Expanded _buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article!.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('By: ${article!.author!}'),
            SizedBox(height: 10,),
            Text(DateFormat('yyyy-MM-dd').format(article!.publishedAt!))
          ],
        ),
      ),
    );
  }

  SizedBox _buildImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: double.maxFinite,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          article!.urlToImage!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.broken_image, size: 25);
          },
        ),
      ),
    );
  }
}
