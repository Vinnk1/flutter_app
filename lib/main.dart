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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_photo_alternate),
        onPressed: (){
          pickImageFromGallery(ImageSource.gallery);
          showImage();
        },
      ),
      body: GestureDetector(
        onTap: () {
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
            child: showImage(),git
          ),
        ),
      ),
    );
  }

  pickImageFromGallery(ImageSource source){
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: _imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
          );
        } else return Text(
          "Hey there",
          style: TextStyle(
            fontSize: 32,
            color: Colors.black
          ),
        );
    });
  }

}