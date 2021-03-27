import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hearvu/pages/recog.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:hearvu/request.dart';
import 'dart:ui';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File imageFile;
  // _pythonOutput(BuildContext context) async {
  //   var data = await getData(' http://10.0.2.2:5000/');
  //   var decodedData = jsonDecode(data) ;
  //
  //   print(decodedData['query']);
  //
  // }
  _openGallery(BuildContext context) async {
    final pictures = await ImagePicker().getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(pictures.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    final pictures = await ImagePicker().getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(pictures.path);
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context,
      {AlertDialog Function(BuildContext context) builder}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Click Your Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("No Image Selected");
    } else {
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HearVu'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // _pythonOutput(),
              _decideImageView(),
              ElevatedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Select Image"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await ApiService().funcName();
                },
                child: Text("click"),
              ),
            ],
            //
          ),
        ),
      ),
    );
  }
}
