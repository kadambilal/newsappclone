class Author {
  final String? yaziId;
  final String? yazarId;
  final String? yazarAdi;
  final String? yazarResmi;
  final String? yazarInfo;
  final String? yaziCategory;
  final String? yaziIcerik;
  final String? yaziTitle;
  final String? yaziTarih;
  Author(
      {
        required this.yaziId,
        required this.yazarId,
        required this.yazarAdi,
        required this.yazarResmi,
        required this.yazarInfo,
        required this.yaziCategory,
        required this.yaziIcerik,
        required this.yaziTitle,
        required this.yaziTarih
      }
      );
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        yaziId: json['yazi_id'],
        yazarId: json['yazar_id'],
        yazarAdi: json['yazar_adi'],
        yazarResmi: json['yazar_resmi'],
        yazarInfo: json['yazar_info'],
        yaziCategory: json['yazi_category'],
        yaziIcerik: json['yazi_icerik'],
        yaziTitle: json['yazi_title'],
        yaziTarih: json['yazi_tarih'],
    );
  }
}
class AuthorsList {
  final List<Author> author;
  AuthorsList({required this.author});
  factory AuthorsList.fromJson(List<dynamic> parsedJson) {
    List<Author> author = parsedJson.map((i) => Author.fromJson(i)).toList();
    return AuthorsList(author: author);
  }
}
