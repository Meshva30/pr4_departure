import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/data_model.dart';

class ShlokProvider extends ChangeNotifier {
  List<ShlokModel> _shlokList = [];
  String selectedLanguage = "hindi";

  List<ShlokModel> get shlokList => _shlokList;


  ShlokProvider() {
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsondata.json');
      List<dynamic> jsonResponse = jsonDecode(jsonString);
      _shlokList = jsonResponse.map((data) => ShlokModel.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }
  void updateSelectedLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }


}
