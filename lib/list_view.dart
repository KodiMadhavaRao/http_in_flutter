import 'dart:math';

import 'package:dio_http/dto/users.dart';
import 'package:flutter/material.dart';
import 'package:dio_http/network/http_util.dart';
import 'package:path/path.dart';

class Items extends StatefulWidget {
  final List<Users> items;

  Items(this.items);

  @override
  State<StatefulWidget> createState() {
    return CLItemsState(items);
  }
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
final Object abc = ObjectKey(0);

class CLItemsState extends State<Items> {
  final List<Users> items;

  CLItemsState(this.items);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: ListView.builder(
        key: abc,
        itemBuilder: _buildProductItems,
        itemCount: items.length,
      ),
    );
  }

  Widget _buildProductItems(BuildContext context, int index) {
    if (index == items.length - 1) {
      Future users=httpUtil.getRandomUsers();
      Widget loading=Container(
        alignment: Alignment.center,
        width: 30.0,
        height: 30.0,
        child: CircularProgressIndicator(),
      );
      new Future.delayed(new Duration(seconds: 2), () {

        users.then((data) {
          setState(() {
            items.addAll(data);
          });
        }, onError: (e) {
          print(e);
        });
      });
      return loading;
    } else {
      return Card(child: Row(children: <Widget>[_getStackView(index), _getLeftRightViews(index)],));
    }
  }

  Widget _getCircle() {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: randomColor()),
    );
  }

  Widget _getStackView(int index) {
    return Container(
        margin: EdgeInsets.all(12.0),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
           /* Image.network(
              widget.items[index].picture,
            )
,*/
            new Container(
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                color: const Color(0xff7c94b6),
                image: new DecorationImage(
                  image: new NetworkImage(widget.items[index].picture),
                  fit: BoxFit.cover,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                border: new Border.all(
                  color: Colors.black38,
                  width: 1.0,
                ),
              ),
            ),
            /*_getCircle(),*/
          ],
        ),
    );
  }

  Color randomColor() =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  Widget _getCenterView(int index) {
    return Column(
      children: <Widget>[
        _getLabelText(widget.items[index].name, 20.0, true, hexToColor("#717171")),
        _getLabelText(widget.items[index].dob, 18.0, false, hexToColor("#717171")),
        _getLabelText(widget.items[index].cell, 16.0, false, hexToColor("#a1a1a1")),
      ],
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _getLabelText(
      String sLabel, double dFontsize, bool isBold, Color hexToColor) {
    return Container(
      padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: Text(
        sLabel,
        style: TextStyle(
            fontSize: dFontsize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: hexToColor),
        textDirection: TextDirection.ltr,
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget _getLeftRightViews(int index) {
    return Row(
      children: <Widget>[_getCenterView(index)/*, _getCornerView(index)*/],
    );
  }

  Widget _getCornerView(int index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          child: _getLabelText(widget.items[index].email, 16.0, false, hexToColor("#737373")),
          margin: EdgeInsets.only(left: 6.0),
        )
      ],
    );
  }

  Future<Null> _refresh() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // Here you can write your code for open new view
        _refreshIndicatorKey.currentState.deactivate();
      });
    });
  }

  Future sleep2() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // Here you can write your code for open new view
      });
    });
  }
}

