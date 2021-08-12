abstract class BaseDataModel {
  BaseItemType? itemType;
}

enum BaseItemType {


  headlineTopNews,
  headlineC,

}

class HeadlineCDataModel implements BaseDataModel {
  final bool clearCachedData;

  HeadlineCDataModel({this.clearCachedData = false});

  @override
  BaseItemType? itemType = BaseItemType.headlineC;
}




class HeadlineTopNews implements BaseDataModel {
  @override
  BaseItemType? itemType = BaseItemType.headlineTopNews;
}

