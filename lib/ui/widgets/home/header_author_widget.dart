
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:newsappclone/RestApi/models/author_model.dart';
import 'package:newsappclone/RestApi/services/rest_api.dart';

class HeadlineAuthorWidget extends StatelessWidget {
  final String? category;
  HeadlineAuthorWidget({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<AuthorsList>(
        future: RestApi.fetchAuthor(category),
        builder: (context,snapshot) {
          if (!snapshot.hasData) {
            return SizedBox();
          } else {
            return Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.author.length,
                itemBuilder: (c, index) {
                  String? yazarAdi = snapshot.data!.author[index].yazarAdi;
                  String? yaziTitle = snapshot.data!.author[index].yaziTitle;
                  String? yazarResmi = snapshot.data!.author[index].yazarResmi;
                  String? yaziIcerik = snapshot.data!.author[index].yaziIcerik;
                  return
                    Card(
                      /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),*/
                      color: Colors.black,
                      child :  Stack(
                        children: [

                           Positioned(child: Image.asset('assets/png/bg.png')),
                            Positioned(top:10, left: 5,height: 125,width: 150,child: Image.network(yazarResmi.toString(),width: 200,height: 200,),),
                          Positioned(top:140, left: 30,height: 125,width: 150, child: Text(yazarAdi.toString(),maxLines: 2,
                            style: TextStyle(color: Colors.white,fontSize: 13),) ,),
                          Positioned(top:10, left: 190,height: 125,width: 220, child: Text(yaziTitle.toString(),maxLines: 2,
                            style: TextStyle(color: Colors.white,fontSize: 25),) ,),
                          Positioned(top:70, left: 190,height: 125,width: 200, child: Text(yaziIcerik.toString(),maxLines: 8,
                            style: TextStyle(color: Colors.white,fontSize: 13),) ,),
                          Positioned(top:185, left: 280,height: 125,width: 200, child: Text("Devamını Oku..",
                            style: TextStyle(color: Colors.white,fontSize: 18,backgroundColor: Colors.black12),) ,),
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