import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide Response;
import '../../models/user/user_model.dart';
import '../../services/api_service.dart';

class UserController extends GetxController {
  final APIServices _apiService = Get.find<APIServices>();
  TextEditingController searchController = TextEditingController();

  var isLoading = false.obs;
  var userList = UserModel().obs;
  bool firstSearch = true;
  String query = "";
  List<String>? filterListName;
  int? filterListIndex;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

   void fetchUsers() async {
    try {
      isLoading(true);
      var users = await _apiService.getUsersAPI();
      if (users.results!.isNotEmpty) {
        userList.value = users;
        isLoading(false);
      }
    } catch(e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading(false);
    }
  }
}



