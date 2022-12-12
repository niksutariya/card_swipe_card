import 'dart:convert';
import 'dart:developer';

import 'package:card_swipe_task/model/property_list_model.dart';
import 'package:card_swipe_task/model/property_list_model.dart'  as list;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  Rx<PropertyList> propertyModel = PropertyList().obs;
  RxList<list.Property?> propertyList = <list.Property?>[].obs;
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController();
  loadJson() async {
    String data = await rootBundle.loadString('assets/json/property_json_response.txt');
    propertyModel.value = PropertyList.fromJson(json.decode(data));
    log("result :- ${propertyModel.value.toJson()}");
    for(int i=0; i<(propertyModel.value.data?.properties?.length ?? 0);i++){
      propertyList.add(propertyModel.value.data?.properties?[i]);
    }
    log("propertyList :-${propertyList.length}");
  }
  @override
  void onInit() {
    loadJson();
    super.onInit();
  }
}