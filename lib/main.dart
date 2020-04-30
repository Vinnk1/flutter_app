import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _alpha, _red, _green, _blue;
  Future<File> _imageFile;

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
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Hello"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_photo_alternate),
          onPressed: () {
            pickImageFromGallery(ImageSource.gallery);
          },
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _imageFile = null;
              _alpha = new Random().nextInt(255);
              _red = new Random().nextInt(255);
              _green = new Random().nextInt(255);
              _blue = new Random().nextInt(255);
            });
          },
          child: Container(
              color: Color.fromARGB(_alpha, _red, _green, _blue),
              child: SizedBox.expand(
                  child: Stack(
                children: <Widget>[
                  Center(
                    child: getImage(),
                  ),
                  Center(
                    child: Text(
                      "Hey there",
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                  )
                ],
              ))),
        ));
  }

  Widget getImage() {
    return Container(
      child: FutureBuilder(
        future: _imageFile,
        builder: (context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Image.file(
              snapshot.data,
              fit: BoxFit.cover,
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }
}
