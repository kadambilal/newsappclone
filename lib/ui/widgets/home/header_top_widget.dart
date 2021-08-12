

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsappclone/RestApi/models/news_model.dart';
import 'package:newsappclone/RestApi/services/rest_api.dart';


class HeadlineTopWidget extends StatelessWidget {
  final String? category;
  HeadlineTopWidget({Key? key, this.category}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: FutureBuilder<NewsList>(
        future: RestApi.fetchNews(category),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return Text("");
          } else {
            return Container(
              height: 262,
              width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.news.length,
                  itemBuilder: (c, index) {
                    String? title = snapshot.data!.news[index].title;
                    String? image = snapshot.data!.news[index].coverImg;
                    return
                       Card(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                          color: Colors.black,
                         child: Stack(
                           children: [
                             Positioned(child: Image.network(image.toString(),width: 400,height: 300,),),
                             Positioned(top:180, left: 30,height: 125,width: 300, child: Text(title.toString(),maxLines: 3,style: TextStyle(color: Colors.yellowAccent,fontSize: 20,backgroundColor:Colors.black),) ,),
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