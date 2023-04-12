import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/homemodel.dart';
import '../provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homeprovider? homeproviderFalse;
  Homeprovider? homeproviderTrue;

  @override
  Widget build(BuildContext context) {
    homeproviderFalse = Provider.of(context, listen: false);
    homeproviderTrue = Provider.of(context, listen: true);



    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse!.findRandomPerson(),
            builder: (context, snapshot) {

              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {


                print("${homeproviderTrue!.index}=======================================================");
                RandomPerson? randomPerson = snapshot.data;
                List<Result>? resultList = randomPerson!.results;
                return Column(
                  children: [

                    SizedBox(height: 20,),
                    Text("Student Placement 2023",style: TextStyle(fontSize: 25,color: Colors.blueGrey.shade700,letterSpacing: 1,fontWeight: FontWeight.w500)),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsetsDirectional.all(10),
                      padding: EdgeInsetsDirectional.all(10),
                      height: 530,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey.shade50,
                            Colors.blueGrey.shade100,
                          ]),
                          border: Border.all(color: Colors.blueGrey, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5,
                                offset: Offset(10, 10),
                                spreadRadius: 1),
                          ]),
                      child: Column(
                        children: [
                          Container(
                            height: 20,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.circular(50),
                              border: Border.all(
                                  color: Colors.blueGrey.shade700, width: 1.5),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(height: 40,child: Image.asset("${homeproviderTrue!.companyImg[homeproviderTrue!.index]}",),alignment: Alignment.center),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsetsDirectional.all(10),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.blueGrey.shade700, width: 2),
                              //borderRadius: BorderRadiusDirectional.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadiusDirectional.circular(100),
                              child: Image.network("${resultList![0].picture!.large}",fit: BoxFit.cover),
                              // child: Image.asset(
                              //   //"${resultList![0].picture!.large}",
                              //   resultList![0].gender == "female"
                              //       ? "${homeproviderTrue!.femaleImg[homeproviderTrue!.index]}"
                              //       : "${homeproviderTrue!.maleImg[homeproviderTrue!.index]}",
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${resultList[0].name!.title}. ${resultList[0].name!.first} ${resultList[0].name!.last}",
                            style: TextStyle(
                              color: Colors.blueGrey.shade700,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "From ${resultList[0].location!.country}",
                            style: TextStyle(
                              color: Colors.blueGrey.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.blueGrey.shade700,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].email}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.blueGrey.shade700,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${resultList[0].location!.street!.number}, ${resultList[0].location!.street!.name}, ${resultList[0].location!.city}",
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "${resultList[0].location!.state}, ${resultList[0].location!.country} , - ${resultList[0].location!.postcode}",
                                          style: TextStyle(
                                            color: Colors.blueGrey.shade700,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.blueGrey.shade700,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].phone}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.telegram,
                                    color: Colors.blueGrey.shade700,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].cell}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.tag,
                                    color: Colors.blueGrey.shade700,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${resultList[0].login!.username}",
                                    style: TextStyle(
                                      color: Colors.blueGrey.shade700,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    InkWell(onTap: () {
                      homeproviderFalse!.changeIndex();
                    },child: Icon(Icons.next_week_rounded,color: Colors.blueGrey.shade700,size: 50)),
                  ],
                );
              }
              return CircularProgressIndicator(color: Colors.blueGrey.shade700,);
            },
          ),
        ),
      ),
    );
  }
}
