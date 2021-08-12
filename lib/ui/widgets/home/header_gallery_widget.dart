import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:core';

import 'package:newsappclone/RestApi/models/gallery_model.dart';
import 'package:newsappclone/RestApi/services/rest_api.dart';

class HeadlineGalleryWidget extends StatelessWidget {
  final String? category;
  HeadlineGalleryWidget({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: FutureBuilder<GalleryNewsList>(
        future: RestApi.fetchGeneralNews(category),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            Center(
              child: Text("",style: TextStyle(fontSize: 50),),
            );
            return Container(
              height: 150,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.galleryNews.length,
                  itemBuilder: (c, index) {
                  String? spot = snapshot.data!.galleryNews[index].spot;
                  String? url1 = snapshot.data!.galleryNews[index].url1;
                  return
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                     color: Colors.black,
                        child: Stack(
                            children: [
                              Positioned(child: Image.network(url1.toString()),),
                              Positioned(top:90, left: 20,height: 125,width: 145, child: Text(spot.toString(),maxLines: 3,
                                style: TextStyle(color: Colors.white,fontSize: 13,backgroundColor:Colors.black,),) ,),
                            ],

                      ),
                    );
                },
              ),
            );
          }
        },
      ),
    );
  }
}