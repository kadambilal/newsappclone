import 'package:flutter/material.dart';
import 'package:newsappclone/RestApi/models/video_model.dart';
import 'package:newsappclone/RestApi/services/rest_api.dart';
import 'dart:core';

class HeadlineVideoWidget extends StatelessWidget {
  final String? category;
  HeadlineVideoWidget({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: FutureBuilder<VideoNewsList>(
        future: RestApi.fetchVideoNews(category),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            return Container(
              height: 134,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.videoNews.length,
                itemBuilder: (c, index) {
                  String? spot = snapshot.data!.videoNews[index].spot;
                  String? image = snapshot.data!.videoNews[index].image;
                  return
                    Card(
                     /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),*/
                      color: Colors.black,
                        child :  Stack(
                            children: [
                            Positioned(child: Image.network(image.toString()),),
                            Positioned(top:75, left: 20,height: 125,width: 150, child: Text(spot.toString(),maxLines: 3,
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