import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../commons/theme/colors.dart';
import '../../../commons/theme/theme_data_extention.dart';
import '../../../constants/tab_constant.dart';

class MainToolbar extends StatelessWidget {
  final List<TabCategory> tabCategoryList;
  final TabController tabController;
  UnderlineTabIndicator? indicator;
  Color? labelColor;
  Color? indicatorColor;
  Color? tabColor;
  bool isScrollable;
  Color? backgroundColor;
  double? height;
  TextStyle? labelStyle;

  MainToolbar({
    Key? key,
    required this.tabCategoryList,
    required this.tabController,
    this.labelColor: ColorHelper.lightModeLightColorLight5,
    this.indicatorColor: ColorHelper.lightModeLightColorLight5,
    this.indicator,
    this.isScrollable = true,
    this.backgroundColor,
    this.tabColor,
    this.height = 25,
    this.labelStyle,
  }) : super(key: key);

 // var _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor ?? context.theme.primaryColor,
      centerTitle: true,
      brightness: Brightness.dark,
      title: getLogo(context),
      floating: true,
      snap: true,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, height!),
        child: Container(
       //b   color: tabColor ?? context.theme.primaryColor,
          height: height!,
          child: TabBar(
            isScrollable: isScrollable,
            controller: tabController,
            labelColor: labelColor,
            indicatorColor: indicatorColor,
            unselectedLabelColor: labelColor!.withOpacity(0.6),
            labelStyle: labelStyle ??
                Theme.of(context).bodySmall2.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
            indicator: indicator ??
                UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: ColorHelper.lightModeLightColorLight5,
                  ),
                ),
            tabs: List.generate(
              tabCategoryList.length,
              (index) => Tab(text: tabCategoryList[index].name),
            ),
          ),
        ),
      ),
    );
  }

  Widget getLogo(BuildContext context) {
    return Text("News App Clone");
  }
}
