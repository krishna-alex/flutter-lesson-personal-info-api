
class PostsModel{
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;

  PostsModel(this.id, this.email, this.firstname, this.lastname, this.avatar);

  factory PostsModel.fromJson(dynamic json){
    return PostsModel(json['id'] as int,
                      json['email'] as String,
                      json['first_name'] as String,
                      json['last_name'] as String,
                      json['avatar'] as String);
  }
  /*factory PostsModel.FromJson(Map<String, dynamic> jsonMap){
    var postJson = PostsModel(
        jsonMap["id"],
        jsonMap["email"],
        jsonMap["firstname"],
        jsonMap["lastname"],
        jsonMap["avatar"]
    );
    return postJson;
  }*/

  @override
  String toString() {
    return '{ ${this.id}, ${this.firstname}, ${lastname}, ${this.email}, ${this.avatar} }';
  }
}