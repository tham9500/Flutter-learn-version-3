import 'dart:async';

import 'package:flutter/material.dart';

class Function_dart extends StatefulWidget {
  Function_dart({Key? key}) : super(key: key);

  @override
  State<Function_dart> createState() => _Function_dartState();
}

class _Function_dartState extends State<Function_dart> {
  int Counter = 0;
  late Timer _timer;
  int number = 0;

  @override
  void initState() {
    super.initState();
    Start_stepdown();
  }

  void Start_stepdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        Counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("function page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [Coun_down(), Number_count()],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Count_btn();
          // Add your onPressed code here!
        },
        label: const Text('plus'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.yellow.shade900,
      ),
    );
  }

  Widget Coun_down() {
    return Container(
      child: Text(
        "${Counter}",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget Number_count() {
    return Container(
      child: Text(
        "${number}",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Count_btn() {
    setState(() {
      number++;
    });
  }
}
