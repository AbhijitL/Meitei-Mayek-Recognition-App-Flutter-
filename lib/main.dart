import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metei_mayek_recognition/screens/mapi.dart';
import 'package:metei_mayek_recognition/screens/select.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detect MetieMayek example',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detect MetieMayek example"),
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                elevation: 0.0,
                color: Colors.blueAccent,
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Mapi()));},
                child: Center(
                  child: Text("kok,sum...",style: TextStyle(fontSize: 30),),
                ),
                ),
              MaterialButton(
                elevation: 0.0,
                color: Colors.cyanAccent,
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Select()));},
                child: Center(
                  child:Text("ama,ani,...",style: TextStyle(fontSize: 30),),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
