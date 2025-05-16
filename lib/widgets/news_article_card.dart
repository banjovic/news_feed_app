import 'package:flutter/material.dart';
import 'package:news_feed_app/widgets/news_model.dart';

class NewsArticleCard extends StatelessWidget {
  const NewsArticleCard({super.key, required this.article});

  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            if (article.imageUrl.isNotEmpty) Image.network(article.imageUrl),
            const SizedBox(height: 8),
            // Title
            Text(
              article.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            // Description
            Text(article.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 6),
            // Date
            Text(
              '${article.publishDate.toLocal()}'.split(' ')[0],
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
