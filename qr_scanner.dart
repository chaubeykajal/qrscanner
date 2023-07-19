import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/pagestyle.dart';

class qr_scannerPage extends StatefulWidget {
  
  @override
  State<qr_scannerPage> createState() => _qr_scannerPageState();
}

class _qr_scannerPageState extends State<qr_scannerPage> {

  final GlobalKey _qrkey=GlobalKey(debugLabel: "QR");
    QRViewController? controller;
    String? result = "";


  @override
  void dispose(){
    controller?.dispose();
    super.dispose();

  }
    
  
  
  void onQRViewCreated(QRViewController qrcontroller){
    setState(() {
      controller= qrcontroller;
      qrcontroller.scannedDataStream.listen((data){
        setState(() {
          result =data.code!;
        });
      });
    });

    // controller?i
    
  }
 
  
  
  @override
  Widget build(BuildContext context) {

    
    var mq=MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
          backgroundColor: c1,
          title: Text("QR Scanner"),
      ),
      backgroundColor: backgroundcolor,

      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Expanded(
              flex:1,
              child: 
                Container(
                  color:Colors.transparent.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(shape: LinearBorder()),
                        onPressed: (){
                          if(result!.isNotEmpty){
                             Clipboard.setData(ClipboardData(text: "$result"));
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied to clipboard")));
                          }
                        },
                        child:Text("copy")
                      ),
                      
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(shape: LinearBorder()),
                        onPressed: ()async{
                          if(result!.isNotEmpty){
                            final Uri url= Uri.parse("$result");
                            await launchUrl(url);
                          }
                        },
                        child:Text("result")
                      ),
                
                    ],
                  ),
                )),
            Expanded(
              flex:5,
              child:qrview(context),),

            Expanded(
              flex: 1,
              child: 
                Center(
                  child: 
                    Text("Scan Result:$result"))
            ), 


            // 


          ]
        )    

    );
  }

  Widget qrview(BuildContext context){
    var scanarea=250.0;
  return QRView(
    key:_qrkey, 

    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: scanarea,
      borderLength: 40,
      borderRadius: 5.0,
      borderWidth: 10,
      borderColor: c1,
    ),
    
    );


}
}
