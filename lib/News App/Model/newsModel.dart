class NewsModel {
  late String status;
  late int totalResults;
  List<Articles> articles = [];

  NewsModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  factory NewsModel.fromJson(Map m1) {
    return NewsModel(
        status: m1['status'],
        totalResults: m1['totalResults'],
        articles:
            (m1['articles'] as List).map((e) => Articles.fromJson(e)).toList());
  }
}

class Articles {
  late String author, title, description, urlToImage,publishedAt,content,url;
  late Source source;

  Articles(
      {required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.publishedAt,
        required this.content,
        required this.source,
        required this.url
      });

  factory Articles.fromJson(Map m1) {
    return Articles(
        author: m1['author'] ?? 'hello',
        title: m1['title'] ?? 'hello',
        description: m1['description'] ??  'Major tech companies, including those in Silicon Valley, are continuing to downsize as they adjust to post-pandemic economic conditions. Layoffs are part of broader cost-cutting measures as the industry faces slowing revenue growth.',
        urlToImage: (m1['urlToImage'] == null || m1['urlToImage'] == "") ? 'https://www.presse-citron.net/app/uploads/2024/07/bangyu-wang-omoCm0bvNW4-unsplash-1-1.jpg' : m1['urlToImage'],
        publishedAt: m1['publishedAt'] ?? '2024-08-12T15:17:57Z',
        content: m1['content'] ?? "If you click 'Accept all', we and our partners, including 237 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]",
        source: Source.fromJson(m1['source']), url: m1['url'] ?? 'https://apnews.com/article/stocks-markets-rates-inflation-0556bf2130a2f6eee478e100d1525045');
  }
}

class Source{
  late String id,name;

  Source({required this.id,required this.name});

  factory Source.fromJson(Map m1){
    return Source(id: m1['id'] ?? 'business-insider', name: m1['name'] ?? 'Design-milk.com');
  }
}
