import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/employee.dart';
import '../screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Django Connectivety',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect with flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EmpList employeeService = EmpList();

  List<Employee> employee = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeService.getEmployeeList().then((value) {
      setState(() {
        employee = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: employee.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                  itemCount: employee.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(employee[index].ename),
                    
                    
                    );
                  })),
    );
  }
}
