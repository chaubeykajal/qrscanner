import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qrproject3/const/pagestyle.dart';
import 'package:qrproject3/screens/home_screen.dart';
import 'package:qrproject3/screens/qr_generator.dart';
import 'package:qrproject3/screens/qr_scanner.dart';


class bottomPage extends StatefulWidget {
  

  @override
  State<bottomPage> createState() => _bottomPageState();
}

class _bottomPageState extends State<bottomPage> {
  
 List screens=[MyHomePage(),qr_scannerPage(),qr_generatorPage()];
  int selected_index=0;

 
  void ontap(int index){
     setState(() {
       selected_index=index;
     });
  }
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         
        bottomNavigationBar:
        CurvedNavigationBar(
          onTap: ontap,
          animationCurve: Curves.linear,
          backgroundColor: c2,
          index:selected_index,
          items: [
          Icon(Icons.home),
          Icon(Icons.qr_code_scanner),
          Icon(Icons.qr_code),
      

      ]),
      
       body:screens[selected_index]
      );

    

  }}