import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class List_menu extends StatefulWidget {
  List_menu({Key? key}) : super(key: key);

  @override
  State<List_menu> createState() => _List_menuState();
}

class _List_menuState extends State<List_menu> {
  List<dynamic> list_data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }

  Future<Null> get_data() async {
    Dio dio = new Dio();
    String url =
        'https://elnventory.com/easy_drive_backend/article_cate/mobile/get_article_cate.php?cate_id=1644794235';
    var response = await Dio().get(url);
    try {
      list_data = json.decode(response.data);
      print("This is data = ${list_data}");
      print("This is data lenght = ${list_data.length}");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              children: [
                Menu_data(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Menu_data() {
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: list_data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
                padding: const EdgeInsets.all(4), child: Data_widget(index)),
          );
        },
      ),
    );
  }

  Widget Data_widget(index) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,

        // color: Colors.amber.shade200,
        child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(255, 255, 255, 1),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 260,
                    child: Text(
                      "${list_data[index]["article_cate_name"]}".length > 30
                          ? "${list_data[index]["article_cate_name"]}"
                                  .substring(0, 30) +
                              " ..."
                          : "${list_data[index]["article_cate_name"]}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () {}));
  }
}
