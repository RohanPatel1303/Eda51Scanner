import 'package:eda51scanner/scanned_data.dart';
import 'package:eda51scanner/scanner_callback.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:eda51scanner/eda51scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements ScannerCallback {
  String _platformVersion = 'Unknown';
  final _eda51scannerPlugin = Eda51scanner();
bool? supported;
  ScannedData? scannedData;
  String? errorMessage;


  Map? get scannedDataMap => null;
  @override
  void initState() {
    super.initState();
    // initPlatformState();
    getsupport();
  }
Future<void> getsupport() async {
  supported=await Eda51scanner().isSupported();
  setState(()  {
     print(supported);
   });
}
  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   // We also handle the message potentially returning null.
  //   try {
  //     platformVersion =
  //         await _eda51scannerPlugin.getPlatformVersion() ?? 'Unknown platform version';
  //   } on PlatformException {
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $supported'),
              ElevatedButton(onPressed: ()async{
                Eda51scanner eda51scanner=await Eda51scanner(
                  onScannerDecodeCallback: (scanneddata){
                    print(scanneddata!.code!);
                  }
                );
                eda51scanner.startScanner();
                eda51scanner.startScanning();
                eda51scanner.onDecoded(scannedDataMap);
                print(scannedDataMap.toString());

              }, child: Text("click me")),
              ElevatedButton(onPressed: (){
                Eda51scanner edascanner=Eda51scanner();
                edascanner.stopScanner();
              }
                  , child: Text("stops"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDecoded(ScannedData? scannedData) {
    print("called");
    setState(() {
      scannedData=scannedData;
  print(scannedData!.code!);
    });
  }

  @override
  void onError(Exception error) {
    setState(() {
      errorMessage=error.toString();
    });
  }
}
