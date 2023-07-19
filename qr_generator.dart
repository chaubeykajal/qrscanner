
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qrproject3/const/pagestyle.dart';



class qr_generatorPage extends StatefulWidget {
  @override
  State<qr_generatorPage> createState() => _qr_generatorPageState();
}

class _qr_generatorPageState extends State<qr_generatorPage> {
  final controller = TextEditingController();
  String qrData = '';

  @override
  Widget build(BuildContext context) {

    var mq= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1,
        title: Text("QR Generator"),
      ),
      backgroundColor: backgroundcolor,
      body:
       Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Center(
                // QrImage 

                child:buildQrImageview()),
                          
                SizedBox(height:20),
              
                Container(
                  width:mq.width*.30,
                  height:mq.height*.20,

                  
                  child: TextField(
                    controller: controller,
                    onChanged: (value){setState(() {
                      qrData=value; });},
                    decoration: InputDecoration(
                      hintText: 'Enter data',
                      hintStyle: TextStyle(color: c1),
                      border: OutlineInputBorder(),
    
                  ),
                ),
              ),

              SizedBox(height:20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: LinearBorder()),
                onPressed:()
                
                async{
                  var qrcodeImage=buildQrImageview();
                  String url=qrcodeImage.toString();
                  await GallerySaver.saveImage(url,albumName: "MyQrCode",toDcim: true);
                  ;},
                child: Text("Download")

                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQrImageview(){
    return QrImageView(
        data:qrData,
        size:200.0,
        backgroundColor: c2,
        );
  }
}
