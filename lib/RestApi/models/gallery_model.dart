class GalleryNews {
  final String? id;
  final String? spot;
  final String? url1;
  final String? url2;
  final String? url3;
  final String? category;
  GalleryNews(
      {
        required this.id,
        required this.spot,
        required this.url1,
        required this.url2,
        required this.url3,
        required this.category
      }
      );
  factory GalleryNews.fromJson(Map<String, dynamic> json) {
    return GalleryNews(
        id: json['id'],
        spot: json['spot'],
        url1: json['url1'],
        url2: json['url2'],
        url3: json['url3'],
        category: json['category']
    );
  }
}
class GalleryNewsList {
  final List<GalleryNews> galleryNews;
  GalleryNewsList({required this.galleryNews});
  factory GalleryNewsList.fromJson(List<dynamic> parsedJson) {
    List<GalleryNews> galleryNews = parsedJson.map((i) => GalleryNews.fromJson(i)).toList();
    return GalleryNewsList(galleryNews: galleryNews);
  }
}
