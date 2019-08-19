import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jlocation/jlocation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    var loc = new Jlocation();
    loc.getLocation().then((loc) {
      setState(() {
        if (!mounted) return;
        _platformVersion = "${loc.last}=${loc.longitude},${loc.latitude}";
      });
    });
//    await loc.onLocationChanged().listen((loc) {
//      setState(() {
//        if (!mounted) return;
//        _platformVersion = "${loc.last}=${loc.longitude},${loc.latitude}";
//      });
//    });

//    await loc.setProperty(1, 10);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
