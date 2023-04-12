import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_api/screens/home/provider/homeprovider.dart';
import 'package:random_user_api/screens/home/view/homescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homeprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splashscreen(),
          'home': (context) => Homescreen(),
        },
      ),
    ),
  );
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4),() {
      Navigator.pushReplacementNamed(context, 'home');
    },);

    return SafeArea(
      child: Scaffold(
        body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(Icons.next_week_rounded,size: 50,color: Colors.blueGrey.shade700),
            SizedBox(height: 10,),
            Text("PlacementHub",style: TextStyle(color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500,letterSpacing: 1,fontSize: 24)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tag,color: Colors.blueGrey.shade700),
                Text("theakhilsarkar",style: TextStyle(color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500,letterSpacing: 1,fontSize: 20)),
              ],
            ),
            SizedBox(height: 10,),
          ],
        )),
      ),
    );
  }
}
