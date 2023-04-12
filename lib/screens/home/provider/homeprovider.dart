import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../../utils/api_helper/apihelper.dart';
import '../model/homemodel.dart';

class Homeprovider extends ChangeNotifier
{
  Future<RandomPerson?> findRandomPerson()
  async {
    return await ApiHelper().randomPersonApi();
  }



  List femaleImg = [
    "assets/female/f1.jpg",
    "assets/female/f2.jpg",
    "assets/female/f3.jpg",
    "assets/female/f4.jpg",
    "assets/female/f5.jpg",
  ];

  List maleImg = [
    "assets/male/m1.jpg",
    "assets/male/m2.jpg",
    "assets/male/m3.jpg",
    "assets/male/m4.jpg",
    "assets/male/m5.jpg",
  ];

  List companyImg = [
    "assets/logo/google.png",
    "assets/logo/ms.png",
    "assets/logo/oracle.png",
    "assets/logo/tcs.png",
    "assets/logo/amz.png",
  ];

}