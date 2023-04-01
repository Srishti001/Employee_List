// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:postgres/postgres.dart';
//import '/env.sample.dart';
import '../model/employee.dart';

class EmpList {
  String baseUrl = "http://127.0.0.1:8003/employee";
  Future<List<Employee>> getEmployeeList() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print("api is calling");
      print(response.statusCode);
      if (response.statusCode == 200) {
        //print(response.body);
        List<Employee> users = (json.decode(response.body) as List)
            .map((data) => Employee.fromJson(data))
            .toList();
        print(users);
        return users;
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
