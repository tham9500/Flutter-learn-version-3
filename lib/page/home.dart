import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:test/page/function.dart';
import 'package:test/page/page_input.dart';

class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test phichet'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.ac_unit_sharp),
            tooltip: 'Show Snackbar',
            onPressed: () {
              print("push button");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              btn_1(),
              SizedBox(height: 20),
              btn_2(),
              SizedBox(height: 20),
              btn_3()
            ],
          ),
        ),
      ),
    );
  }

  Widget btn_1() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green.shade400),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            )),
        onPressed: () {
          print("push button");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Input_page()));
        },
        child: Text(
          "Page input",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget btn_2() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            )),
        onPressed: () {
          print("push button");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Function_dart()));
        },
        child: Text(
          "Function page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget btn_3() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            )),
        onPressed: () {
          print("push button");
        },
        child: Text(
          "Button",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
