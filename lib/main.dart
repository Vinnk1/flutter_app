import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() =>
    runApp(Directionality(
        textDirection: TextDirection.ltr,
        child: MaterialApp(debugShowCheckedModeBanner: false,
          initialRoute:'/myApp',
          routes: {
            '/': (BuildContext context) => SecondScreen(),
            '/myApp': (BuildContext context) => MyApp()
          },
        )));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _alpha, _red, _green, _blue;
  int x = 0;
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
    changeNumber();
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
          child: Stack(
            children: <Widget>[
              Center(
                child: SizedBox.expand(
                  child: getImage(),
                ),
              ),
              Center(
                child: Text(
                  "Hey there : $x",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
              )
            ],
          )),
    );
  }

  Widget getImage() {
    return Container(
      color: Color.fromARGB(_alpha, _red, _green, _blue),
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

  changeNumber() async {
    while (x < 100) {
      x++;
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
    }
  }

  pickImageFromGallery(ImageSource source) {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: source);
    });
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/myApp");
          },
          child: Text("open first window"),
        ),
      ),
    );
  }

}
