import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappclone/constants/tab_constant.dart';
import 'package:newsappclone/data/basedatamodel/base_data_model.dart';
import 'package:newsappclone/thirdparty/inviewscroll/src/inview_notifier_list.dart';
import 'package:newsappclone/ui/widgets/home/header_author_widget.dart';
import 'package:newsappclone/ui/widgets/home/header_gallery_widget.dart';
import 'package:newsappclone/ui/widgets/home/header_top_widget.dart';
import 'package:newsappclone/ui/widgets/home/header_video_widget.dart';
import 'package:newsappclone/viewmodel/bottomnavigation/home_category/home_category_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeCategoryPage extends StatelessWidget {
  final int index;
  final TabCategory category;
  const HomeCategoryPage(
      {Key? key, required this.index, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryViewKey =
        (key as PageStorageKey).value.toString() + category.name;
    print('HomeCategoryPage.build key [ $categoryViewKey ]');
    return ViewModelBuilder<HomeCategoryPageModel>.reactive(
      viewModelBuilder: () => HomeCategoryPageModel(category),
      disposeViewModel: true,
      builder: (context, model, child) {
        return StreamBuilder(
          stream: model.controller?.stream,
          builder: (context, AsyncSnapshot<List<BaseDataModel>> snapshot) {
            if (!snapshot.hasData) {
              print("data error");
              return Center(child: CupertinoActivityIndicator());
            } else {
               return RefreshIndicator(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                   child:
                     buildInViewNotifierList(model, categoryViewKey, snapshot),
                 ),
                onRefresh: model.refresh,
               );
            }
          },
        );
      },
    );
  }

  InViewNotifierList buildInViewNotifierList(HomeCategoryPageModel model,
      String categoryViewKey, AsyncSnapshot<List<BaseDataModel>> snapshot) {
    return InViewNotifierList(
      itemCount: snapshot.data!.length + 1,
      onListEndReached: () {
        if (!model.isDataLoading) {
          model.loadMore();
        }
      },
      builder: (context, index) {
        String? categoryName = category.name;
      if (index < snapshot.data!.length*2) {
          if(index==0) {
            return  Padding(
                    padding: const EdgeInsets.only(left:1.0),
                    child: HeadlineTopWidget(category: categoryName) //onemlli header tab.
            );
          }
          else if(index==1 ) {
            return  Padding(
                padding: const EdgeInsets.only(left:180.0),
                child: Text("Foto Galeri",style: TextStyle(fontSize: 17,color: Colors.white),)
            );
          }
          else if(index==2 ) {
            return  Padding(
                padding: const EdgeInsets.only(left:1.0),
                child: HeadlineGalleryWidget(category: categoryName)
            );
          }
          else if(index==3 ) {
            return  Padding(
                padding: const EdgeInsets.only(left:180.0),
                child: Text("Video Galeri",style: TextStyle(fontSize: 17,color: Colors.white),)
            );
          }
          else if(index==4 ) {
            return  Padding(
                padding: const EdgeInsets.only(left:1.0),
                child: HeadlineVideoWidget(category: categoryName)
            );
          }
          else if(index==5 && categoryName =="Bugun" ) {
            return  Padding(
                padding: const EdgeInsets.only(left:190.0),
                child: Text("Yazarlar",style: TextStyle(fontSize: 17,color: Colors.white),),
            );
          }
          else if(index==6 && categoryName =="Bugun" ) {
            return  Padding(
                padding: const  EdgeInsets.only(left:1.0),
                child: HeadlineAuthorWidget(category: categoryName)
            );
          }
        }
        return Container();
      },
      isInViewPortCondition: (deltaTop, deltaBottom, vpHeight) {
        return (deltaTop < (0.5 * vpHeight) &&
            deltaBottom > (0.5 * vpHeight) - 200);
      },
    );
  }
}
