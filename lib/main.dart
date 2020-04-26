import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: MyApp(),
    )
);

class MyApp extends StatefulWidget{

  @override
  State<MyApp> createState() =>_MyAppState();

}

class _MyAppState extends State<MyApp>{
  int _alpha, _red,_green,_blue;


  @override
  void initState() {
    super.initState();
    _alpha = new Random().nextInt(255);
    _red = new Random().nextInt(255);
    _green = new Random().nextInt(255);
    _blue = new Random().nextInt(255);
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          setState(() {
            _alpha = new Random().nextInt(255);
            _red = new Random().nextInt(255);
            _green = new Random().nextInt(255);
            _blue = new Random().nextInt(255);
          });
        },
        child: Container(
          color: Color.fromARGB(_alpha, _red, _green, _blue),
          child: Center(
            child: Text(
              "Hey there",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
        ),
      );
  }

}


