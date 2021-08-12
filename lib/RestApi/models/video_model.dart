class VideoNews {
  final String? id;
  final String? spot;
  final String? url;
  final String? image;
  final String? category;
  VideoNews(
      {
        required this.id,
        required this.spot,
        required this.url,
        required this.image,
        required this.category
      }
      );
  factory VideoNews.fromJson(Map<String, dynamic> json) {
    return VideoNews(
        id: json['id'],
        spot: json['spot'],
        url: json['url'],
        image: json['image'],
        category: json['category']
    );
  }
}
class VideoNewsList {
  final List<VideoNews> videoNews;
  VideoNewsList({required this.videoNews});
  factory VideoNewsList.fromJson(List<dynamic> parsedJson) {
    List<VideoNews> videoNews = parsedJson.map((i) => VideoNews.fromJson(i)).toList();
    return VideoNewsList(videoNews: videoNews);
  }
}
