import 'package:flutter/material.dart';
import 'package:newsappclone/app/app.locator.dart';
import 'package:newsappclone/constants/tab_constant.dart';
import 'package:newsappclone/ui/widgets/appbars/main_appbar.dart';
import 'package:newsappclone/viewmodel/bottomnavigation/home_navigation_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'home_category_page.dart';

class HomeNavigationView extends StatefulWidget {
  const HomeNavigationView({Key? key}) : super(key: key);
  @override
  _HomeNavigationViewState createState() => _HomeNavigationViewState();
}
class _HomeNavigationViewState extends State<HomeNavigationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeNavigationViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) {
        _tabController = TabController(
            vsync: this,
            initialIndex: model.currentIndex,
            length: TabConstant.instance.homeCategoryList.length);
        _tabController.addListener(() {
          if (!_tabController.indexIsChanging) {
            model.setIndex(_tabController.index);
          }
        });
      },
      viewModelBuilder: () => locator<HomeNavigationViewModel>(),
      builder: (context, model, child) {
        return getPage(context, model);
      },
    );
  }

  Widget getPage(BuildContext context, HomeNavigationViewModel model) {
    return NestedScrollView(
      headerSliverBuilder: (context, boxIsScrolled) {
        return <Widget>[
          MainToolbar(
            tabController: _tabController,
            tabCategoryList: TabConstant.instance.homeCategoryList,
           tabColor:
             TabConstant.instance.homeCategoryList[model.currentIndex].color,
            backgroundColor:
                TabConstant.instance.homeCategoryList[model.currentIndex].color,
          ),
        ];
      },
      body: TabBarView(
        key:
            PageStorageKey((widget.key as PageStorageKey).value + "tabBarView"),
        children: List.generate(
          TabConstant.instance.homeCategoryList.length,
          (index) => HomeCategoryPage(
            key: PageStorageKey(
                (widget.key as PageStorageKey).value + "tabBarView" + "$index"),
            category: TabConstant.instance.homeCategoryList[index],
            index: index,
          ),
        ),
        controller: _tabController,
      ),
    );
  }
}
