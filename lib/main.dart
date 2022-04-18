import 'package:flutter/material.dart';
import 'package:personal_info_api/personal_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Info API',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Personal information")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Personal Information"),
            ElevatedButton(onPressed: (){
            DisplayPersonalInfo(context);
            }, child: const Text("Display Personal Info")),
          ],
        )
      )
    );
  }

  void DisplayPersonalInfo(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonalInfoScreen()));

  }


  
}

