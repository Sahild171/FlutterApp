import 'package:flutter_app/Models/UserModel.dart';
import 'package:http/http.dart' as http;



class ApiService{

  Future<List<UserModel>> fetchUsersFromGitHub() async {
    String url = "https://api.github.com/users";
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if(response.statusCode==200){
     var model=userModelFromJson(response.body);
      return model;
    }else{
      throw Exception("network error");
    }


  }
}