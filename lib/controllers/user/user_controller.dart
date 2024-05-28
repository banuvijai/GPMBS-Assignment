import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;
import '../../models/user/user_model.dart';
import '../../services/api_service.dart';
import '../../services/api_urls.dart';


class UserController extends GetxController {
  final APIServices _apiService = Get.find<APIServices>();
  TextEditingController searchController = TextEditingController();
  var isLoading = false.obs;
  var userList = UserModel().obs;

  bool firstSearch = true;
  String query = "";
  List inputList=[];
  List<String>? filteredList;
  List<String>? filterListName;
  int? onTappedIndex;

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
        for(int k=0;k<userList.value.results!.length;k++){
          userList.value.results![k].filteredIndex=k;
          print("API response index --> ${userList.value.results![k].filteredIndex}");
          inputList.add(userList.value.results![k].filteredIndex);
          print("Input List --> $inputList");
        }
        isLoading(false);
      }
    } catch(e) {
      print(e);
      isLoading(false);
    }
  }

}

