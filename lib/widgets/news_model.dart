class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishDate;

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishDate,
  });
}

final Map<String, String> countryNames = {
  "ALL": "All Countries",
  "NG": "Nigeria",
  "US": "United States",
  "GB": "United Kingdom",
  "CA": "Canada",
};
