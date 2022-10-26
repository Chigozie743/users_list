import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {

  // static Future<void> getUsers() async{
  //   var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  //   print("response ${jsonDecode(response.body)}");
  // }

  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> getUsers() async{
    var url = "$baseUrl/users";
    final uri = Uri.parse(url);

    try{
      final response = await http.get(uri);

      if(response.statusCode == 200){
        List<dynamic> list = jsonDecode(response.body);
        return list;
      }else {
        return [];
      }

    }catch(error) {
      print(error);
      return [];
    }
  }
}