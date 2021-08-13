import 'package:injectable/injectable.dart';
import 'package:newsappclone/constants/tab_constant.dart';
import 'package:newsappclone/data/basedatamodel/base_data_model.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class HomeNavigationViewModel extends IndexTrackingViewModel {
  Map<TabCategory, List<BaseDataModel>> _dataMap = {};

  List<BaseDataModel>? getCategoryDataList(TabCategory category) =>
      _dataMap[category];

  setCategoryDataList(TabCategory category, List<BaseDataModel> data) {
    _dataMap[category] = data;
  }

  bool hasCategoryData(TabCategory category) {
    return _dataMap.containsKey(category);
  }
}
