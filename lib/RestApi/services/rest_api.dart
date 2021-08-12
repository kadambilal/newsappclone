import 'package:http/http.dart' as http;
import 'package:newsappclone/RestApi/models/author_model.dart';
import 'package:newsappclone/RestApi/models/gallery_model.dart';
import 'dart:convert';
import 'package:newsappclone/RestApi/models/news_model.dart';
import 'package:newsappclone/RestApi/models/video_model.dart';

class RestApi {
  static Future<NewsList> fetchNews(String? category) async {
    var url = Uri.parse('https://denizhanyigit.com/news/get_all?category_name='+category.toString());
      final response = await http.get(url);
        final data = utf8.decode(response.bodyBytes);
        final jsonResponse = json.decode(data);
        return NewsList.fromJson(jsonResponse);
  }
  static Future<GalleryNewsList> fetchGeneralNews(String? category) async {
    var url = Uri.parse('https://denizhanyigit.com/ys-flutter/gallery.php/get_all?category_name='+category.toString());
    final response = await http.get(url);
    final data = utf8.decode(response.bodyBytes);
    final jsonResponse = json.decode(data);
    return GalleryNewsList.fromJson(jsonResponse);
  }
  static Future<VideoNewsList> fetchVideoNews(String? category) async {
    var url = Uri.parse('https://denizhanyigit.com/ys-flutter/video.php/get_all?category_name='+category.toString());
    final response = await http.get(url);
    final data = utf8.decode(response.bodyBytes);
    final jsonResponse = json.decode(data);
    return VideoNewsList.fromJson(jsonResponse);
  }
  static Future<AuthorsList> fetchAuthor(String? category) async {
    var url = Uri.parse('https://denizhanyigit.com/ys-flutter/author.php/get_all?category_name='+category.toString());
    final response = await http.get(url);
    final data = utf8.decode(response.bodyBytes);
    final jsonResponse = json.decode(data);
    return AuthorsList.fromJson(jsonResponse);
  }
}