class News {
  final String? id;
  final String? author;
  final String? category;
  final String? title;
  final String? spot;
  final String? desc;
  final String? coverImg;
  final String? publishDate;
  News(
      {
        required this.id,
        required this.author,
        required this.category,
        required this.title,
        required this.spot,
        required this.desc,
        required this.coverImg,
        required this.publishDate
      }
      );
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        id: json['id'],
        author: json['author'],
        category: json['category'].toString(),
        title: json['title'],
        spot: json['spot'],
        desc: json['desc'],
        coverImg: json['cover_img'],
        publishDate: json['publish_date']
    );
  }
}
class NewsList {
  final List<News> news;
  NewsList({required this.news});
  factory NewsList.fromJson(List<dynamic> parsedJson) {
    List<News> news = parsedJson.map((i) => News.fromJson(i)).toList();
    return NewsList(news: news);
  }
}
