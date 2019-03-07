import 'package:dio_http/dio_call.dart';
import 'package:dio_http/http_call.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Networking',
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Using HTTP'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HttpScreen()),
              );
            },
          ),
          RaisedButton(
            child: Text('Using Dio'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DioScreen()),
              );
            },
          )
        ],
      )),
    );
  }
}


