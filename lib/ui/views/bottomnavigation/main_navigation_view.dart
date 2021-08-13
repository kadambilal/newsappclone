import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsappclone/viewmodel/bottomnavigation/main_navigation_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../commons/theme/colors.dart';
import '../../../commons/theme/theme_data_extention.dart';
import '../../../constants/strings.dart';
import 'home/home_navigation_view.dart';


class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _screens = [
    HomeNavigationView(),

  ];
  final PageStorageBucket _bucked = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
  //  setupBottomSheetUi();
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black12,
          bottomNavigationBar: buildBottomNavigationBar(model, context),
          body: PageStorage(
              bucket: _bucked, child: getViewForIndex(model.currentIndex)),
        );
      },
      viewModelBuilder: () => MainViewModel(),
    );
  }
  BottomNavigationBar buildBottomNavigationBar(
      MainViewModel model, BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorHelper.lightModeDarkColorDark1,
      unselectedItemColor: ColorHelper.lightModeLightColorLight5,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: Theme.of(context).bodySmall2,
      unselectedLabelStyle: Theme.of(context).bodySmall1,
      currentIndex: model.currentIndex,
      onTap: model.setIndex,
      items: bottomNavigationItems(context),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationItems(BuildContext context) {
    return [
      prepareBottomNavigationItem(
          Strings.navigationHome,
          "assets/svg/icon_bottom_bar_home.svg",
          Theme.of(context).primaryColor,
          ColorHelper.lightModeLightColorLight5),
      prepareBottomNavigationItem(
          Strings.navigationAuthor,
          "assets/svg/icon_bottom_bar_authors.svg",
          Theme.of(context).primaryColor,
          ColorHelper.lightModeLightColorLight5),
    ];
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeNavigationView(
            key: PageStorageKey<String>("HomeNavigationStorageKey"));
     default:
        return HomeNavigationView(
            key: PageStorageKey<String>("HomeNavigationStorageKey"));
    }
  }

  BottomNavigationBarItem prepareBottomNavigationItem(String label,
      String iconPath, Color selectedColor, Color unselectedColor) {
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        iconPath,
        color: unselectedColor,
      ),
      activeIcon: SvgPicture.asset(
        iconPath,
        color: selectedColor,
      ),
    );
  }
}
