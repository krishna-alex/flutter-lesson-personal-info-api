import 'package:flutter/material.dart';
import 'package:personal_info_api/posts_model.dart';

class PostItem extends StatelessWidget{
  final PostsModel currentPostModel;

  const PostItem(this.currentPostModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //padding: const EdgeInsets.all(5),
        child: Card(
          clipBehavior: Clip.antiAlias,
          //elevation: 5,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(
                    currentPostModel.avatar,
                    height: 58,
                    width: 100),
              ),
              const SizedBox(width: 10,),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:  <Widget>[
                    const SizedBox(height: 10,),
                    Text(
                      "${currentPostModel.id} : ${currentPostModel.firstname} ${currentPostModel.lastname}",
                      style: const TextStyle(color: Colors.deepPurple, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Email: ${currentPostModel.email}",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),

            ],
          ),
        )

      /*

      child: Card(
        clipBehavior: Clip.antiAlias,

        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(currentPostModel.avatar),
            const SizedBox(height: 2,),
            Text("Id: ${currentPostModel.id}"),
            const SizedBox(height: 2,),
            Text("First name: ${currentPostModel.firstname}"),
            const SizedBox(height: 2,),
            Text("Last name:  ${currentPostModel.lastname}"),
            const SizedBox(height: 2,),
            Text("Email: ${currentPostModel.email}"),
          ],
        ),
      ),*/
    );
  }

}