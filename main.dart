import 'package:flutter/material.dart';


import 'package:qrproject3/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFC85C8E)),
        useMaterial3: true,
      ),
       debugShowCheckedModeBanner:false,
      home: splash_page(),

      
    );

    
  }
}



