import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// used provider state management
class ApiProvider with ChangeNotifier{


  Future<dynamic> fetchCount ()async{
// get API used http
    const url = 'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode';
    final res =await http.get(Uri.parse(url)) ;

    if(res.statusCode == 200 ){
      var obj = json.decode(res.body);
      return await obj;

    }else {
      return Exception('Error') ;
    }

  }
}