import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Select extends StatefulWidget {
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool _isLoading;
  File _image;
  List _output;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    loadModel().then((value){
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ama, ani.."),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _isLoading ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ):Center(child:Container(
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Container():Image.file(_image),
            SizedBox(height:17),
              _output == null ? Text(""):Text("${_output[0]["label"]}",style: TextStyle(fontSize:40),),
          ],
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          choosImage();
        },
        child: Icon(Icons.image),
        ),
    );
  }
choosImage()async{
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  if(image ==null) return null;
  setState(() {
    _isLoading = true;
    _image = image;
  });
  runModelOnImage(image);
}

runModelOnImage(File image)async{
  var output = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 9,
    imageMean: 127.5,
    imageStd: 127.5,
    threshold: 0.5
  );
  setState(() {
    _isLoading = false;
    _output = output;
  });
}

loadModel() async {
  await Tflite.loadModel(
    model: "assets/model_unquant.tflite",
    labels: "assets/labels.txt"
    );
}

}

