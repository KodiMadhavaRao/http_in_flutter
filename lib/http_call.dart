import 'package:dio_http/dto/users.dart';
import 'package:dio_http/list_view.dart';
import 'package:dio_http/network/http_util.dart';
import 'package:flutter/material.dart';

class HttpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpScreenState();
  }
}

class HttpScreenState extends State<HttpScreen> {
  Future users;
  List<Users> clUsersList=new List();
  @override
  void initState() {
    super.initState();
    users=httpUtil.getRandomUsers();
    users.then((data) {
      setState(() {
        clUsersList.addAll(data);
      });
    }, onError: (e) {
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Request"),
      ),
      body:createListView(),
    );
  }



  Widget createListView() {
    return Items(clUsersList);
  }
}
