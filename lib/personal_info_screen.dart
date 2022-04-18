import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:personal_info_api/post_item.dart';
import 'dart:developer' as developer;

import 'package:personal_info_api/posts_model.dart';


class PersonalInfoScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => PersonalInfoState();
  }


class PersonalInfoState extends State<PersonalInfoScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personal Details")),
      body: Container(
        child: FutureBuilder(
          future: hitServerToGetPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            ///When the future builder does not have any data then show loading
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              List<PostsModel> postsList = snapshot.data;
              developer.log("In Else");
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: postsList.length,
                  itemBuilder: (BuildContext context, int index){
                    PostsModel currentPost = postsList[index];
                    developer.log("In ListView.builder");
                    return PostItem(currentPost);
                  }
              );
            }
          },
        ),
      )
    );

  }
  Future<List<PostsModel>> hitServerToGetPosts() async{
    String _TAG = "APIResponse";
    String url = "https://jsonkeeper.com/b/08Z0";
    List<PostsModel> postsList = [];
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      developer.log("API response was successful", name: _TAG);
      List<dynamic> responseData = json.decode(response.body);
      for(var individualPosts in responseData){
        PostsModel currentPost = PostsModel.fromJson(individualPosts);
        developer.log("Data received $currentPost ", name: _TAG);
        postsList.add(currentPost);
      }
    }
    else{
      developer.log("API response failed", name: _TAG);
    }
    return Future.value(postsList);
  }
  
}