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
              height: 262,
              width: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.author.length,
                itemBuilder: (c, index) {
                  String? yazarAdi = snapshot.data!.author[index].yazarAdi;
                  String? yaziTitle = snapshot.data!.author[index].yaziTitle;
                  String? yazarResmi = snapshot.data!.author[index].yazarResmi;
                  return
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child : Column(
                          children: [
                            Text(yazarAdi.toString(),style: TextStyle(color: Colors.white,fontSize: 25)),
                            Text(yaziTitle.toString(),style: TextStyle(color: Colors.white,fontSize: 25)),
                            Image.network(yazarResmi.toString(), height: 190,
                              width: 400,),
                          ],
                        ),


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