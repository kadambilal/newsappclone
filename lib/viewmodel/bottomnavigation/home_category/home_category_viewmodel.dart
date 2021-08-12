import 'dart:async';
import 'package:newsappclone/app/app.locator.dart';
import 'package:newsappclone/constants/tab_constant.dart';
import 'package:newsappclone/data/basedatamodel/base_data_model.dart';
import 'package:stacked/stacked.dart';
import '../home_navigation_viewmodel.dart';

class HomeCategoryPageModel extends BaseViewModel {
  late int _currentPage;

  final TabCategory _category;
  late bool hasMore;

  late bool _isLoading;
  late List<BaseDataModel> _data;
  late StreamController<List<BaseDataModel>>? controller;

  late List<BaseDataModel> _initialItemList = [];

  bool get isDataLoading => _isLoading;

  HomeCategoryPageModel(this._category) {
    _currentPage = 0;
    _data = [];
    controller = StreamController<List<BaseDataModel>>();
    _isLoading = false;
    hasMore = true;

    if (locator<HomeNavigationViewModel>().hasCategoryData(_category)) {
      _data =
          locator<HomeNavigationViewModel>().getCategoryDataList(_category)!;
    } else {
      prepareInitialDataByCategory(false);
      _data.addAll(_initialItemList);
      locator<HomeNavigationViewModel>().setCategoryDataList(_category, _data);
    }

    controller?.add(_data);
  }
  prepareInitialDataByCategory(bool clearCachedData) {
    _initialItemList.add(HeadlineCDataModel(clearCachedData: clearCachedData));

    if (_category.id == TabConstant.today.id) {
      _initialItemList.add(HeadlineTopNews());
    }
  }

  Future<void> refresh({bool clearCachedData = true}) {
    return loadMore(clearCachedData: clearCachedData);
  }

  Future<void> loadMore({bool clearCachedData = false}) async {
    if (clearCachedData) {
      _data.clear();
      controller?.add(_data);
      await Future.delayed(Duration(milliseconds: 0));

      prepareInitialDataByCategory(true);
      _data.addAll(_initialItemList);

      controller?.add(_data);
      _currentPage = 0;
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;

    _currentPage++;
    _isLoading = false;


  }

  @override
  void dispose() {
    controller?.close();
    super.dispose();
  }
}
