import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:node_app/models/users.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List datas;
  final String API_URL = "http://192.168.8.101:3000/api/users";

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(API_URL), headers: {"Accept": "application/json"});
    print(res.body);

    var data = json.decode(res.body);

    setState(() {
      datas = data["users"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: datas != null
              ? ListView.builder(
                  itemBuilder: (context, int i) {
                    return Text(datas[i]["email"]);
                  },
                  itemCount: datas.length,
                )
              : null),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
