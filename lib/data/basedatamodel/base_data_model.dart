abstract class BaseDataModel {
  BaseItemType? itemType;
}
enum BaseItemType {
  headlineTopNews,
}
class HeadlineTopNews implements BaseDataModel {
  final bool clearCachedData;
  HeadlineTopNews({this.clearCachedData = false});
  @override
  BaseItemType? itemType = BaseItemType.headlineTopNews;
}

