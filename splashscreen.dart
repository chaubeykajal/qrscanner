import 'dart:async';

import 'package:flutter/material.dart';

import 'package:qrproject3/screens/bottomnav.dart';

import '../const/pagestyle.dart';


class splash_page extends StatefulWidget {
  

  @override
  State<splash_page> createState() => splash_pageState();
}

class splash_pageState extends State<splash_page> {
  
    void initState(){
    super.initState();
    Timer(Duration(seconds:4),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (Context)=>bottomPage()));});}
 
  
  @override
  Widget build(BuildContext context) {
    var mq=MediaQuery.of(context).size;
     return SafeArea(
       child: Scaffold(
       
          body:
     
          
           Column(
             children: [
              Expanded(
                flex:4,
                child: Stack(
                  children:[
                     
                      
                         Container(
                          width:mq.width,
                          height: mq.height,
                          child:Image.asset("images/wallpaper.png",fit:BoxFit.fill),
                        ),
                      
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                      
                              child:Image.asset("images/scan.png",height:120,width:120,),
                            ),
                            Text("Qr Scanner",style: TextStyle(color: c1,fontSize:25),),
                          ],
                        ),

                      
                      ),
                      // SizedBox(height:),
                      Text("Qr Scanner"),

                      ],
                 ),
              ),
              

                  //  SizedBox(height:10),
                  // Expanded( flex:1,child: Text("Qr Scanner"))
           ]),
           ),
       
       
     );
     
}}