

import 'package:flutter/material.dart';
import 'package:qrproject3/screens/qr_generator.dart';
import 'package:qrproject3/screens/qr_scanner.dart';

import '../const/pagestyle.dart';


class MyHomePage extends StatefulWidget {
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  
  @override
  Widget build(BuildContext context) {
    var mq= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: c1,
          title: Text("Qr Code Scanner",),
      ),
      backgroundColor: backgroundcolor,
      body: Center(
          child:Column(
          children:[
            
            
            Expanded(
            flex:9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                 ElevatedButton(
                  style:  ElevatedButton.styleFrom(shape: LinearBorder()),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>qr_scannerPage()));
                  }, 
                  child:Text("QR Code Scanner")),
          
                SizedBox(height:40,),
          
                ElevatedButton(
                  style:ElevatedButton.styleFrom(shape: LinearBorder()),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>qr_generatorPage()));
                  }, 
                  child:Text("QR Code Generator")),
                ] )),
      
      
              
              ],
            ),
          ),
      
      

    );
  }
}
