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
            child: showImage(),
//            child: Text(
//              "Hey there",
//              style: TextStyle(
//                fontSize: 32,
//                color: Colors.black,
//              ),
//            ),
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
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

}

class PickImageDemo extends StatefulWidget {
  @override
  _PickImageDemoState createState() => _PickImageDemoState();
}

class _PickImageDemoState extends State<PickImageDemo> {
  Future<File> imageFile;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            showImage(),
            RaisedButton(
              child: Text("Select Image from Gallery"),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
