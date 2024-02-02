import 'package:flutter_app/Models/UserModel.dart';
import 'package:flutter_app/Services/ApiServices.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var userlist = <UserModel>[].obs;

  fetchuserlist() async {
    try {
      isLoading(true);
      var userData = await ApiService().fetchUsersFromGitHub();
      userlist.addAll(userData);
    } catch (e) {
      print("error fetching data $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchuserlist();
    super.onInit();
  }
}
