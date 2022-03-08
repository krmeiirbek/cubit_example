import 'dart:convert';

import 'package:cubit_example/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    final response = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(response.statusCode == 200){
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
    }catch(e){
      print(e);
    }
    return <DataModel>[];
  }
}