import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  double currHeight = 150;
  int age = 20;
  int weight = 60;
  Color unpressed = Color(0xFF222222);
  Color pressed = Colors.pink;
  Color male_curr = Colors.pink;
  Color female_curr = Color(0xFF222222);
  Map<String, String> bmiCategories = {
    "Severe Thinness": "Your BMI is very low. Consider seeking medical advice.",
    "Moderate Thinness": "Your BMI is low. A balanced diet may help.",
    "Mild Thinness":
        "You are slightly underweight. Maintaining a nutritious diet is important.",
    "Normal": "You have a normal body weight. Good job!",
    "Overweight": "You are slightly overweight. A healthy lifestyle can help.",
    "Obese Class I":
        "Your BMI indicates obesity. Consider a balanced diet and exercise.",
    "Obese Class II":
        "Your BMI is quite high. Medical consultation is recommended.",
    "Obese Class III":
        "Severe obesity detected. Professional health guidance is advised."
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Center(
                child: Text(
              "BMI Calculator",
              style: TextStyle(color: Colors.white),
            )),
          ),
          body: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      male_curr = pressed;
                      female_curr = unpressed;
                      setState(() {});
                    },
                    child: Container(
                      height: 170,
                      width: 186,
                      decoration: BoxDecoration(
                          color: male_curr,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Icon(Icons.male, size: 100, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      female_curr = pressed;
                      male_curr = unpressed;
                      setState(() {});
                    },
                    child: Container(
                      height: 170,
                      width: 186,
                      decoration: BoxDecoration(
                          color: female_curr,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Icon(Icons.female, size: 100, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 195,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: unpressed),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Height",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${currHeight.toStringAsFixed(1)}",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                          SizedBox(width: 5),
                          Text("cm",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white))
                        ],
                      ),
                      SizedBox(height: 10),
                      Slider(
                          value: currHeight,
                          thumbColor: pressed,
                          activeColor: pressed,
                          onChanged: (height) {
                            setState(() {
                              currHeight = height;
                            });
                          },
                          min: 100,
                          max: 220)
                    ],
                  )),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //  SizedBox(width: 10),
                  Container(
                    height: 180,
                    width: 186,
                    decoration: BoxDecoration(
                        color: unpressed,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text("Age",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        SizedBox(height: 10),
                        Text(
                          "$age",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  age > 1 ? age -= 1 : age;

                                  setState(() {});
                                },
                                icon: Icon(Icons.remove, color: Colors.white)),
                            IconButton(
                                onPressed: () {
                                  age += 1;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                  // SizedBox(width: 20),
                  Container(
                    height: 180,
                    width: 186,
                    decoration: BoxDecoration(
                        color: unpressed,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text("Weight",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$weight",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                            SizedBox(width: 7),
                            Text(
                              "Kg",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  weight > 1 ? weight -= 1 : weight;

                                  setState(() {});
                                },
                                icon: Icon(Icons.remove, color: Colors.white)),
                            IconButton(
                                onPressed: () {
                                  weight += 1;
                                  setState(() {});
                                },
                                icon: Icon(Icons.add, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    double BMI = weight / (pow(currHeight / 100, 2));
                    String title;
                    String message;

                    if (BMI < 16) {
                      title = "Severe Thinness";
                      message = bmiCategories["Severe Thinness"]!;
                    } else if (BMI >= 16 && BMI < 17) {
                      title = "Moderate Thinness";
                      message = bmiCategories["Moderate Thinness"]!;
                    } else if (BMI >= 17 && BMI < 18.5) {
                      title = "Mild Thinness";
                      message = bmiCategories["Mild Thinness"]!;
                    } else if (BMI >= 18.5 && BMI < 25) {
                      title = "Normal";
                      message = bmiCategories["Normal"]!;
                    } else if (BMI >= 25 && BMI < 30) {
                      title = "Overweight";
                      message = bmiCategories["Overweight"]!;
                    } else if (BMI >= 30 && BMI < 35) {
                      title = "Obese Class I";
                      message = bmiCategories["Obese Class I"]!;
                    } else if (BMI >= 35 && BMI < 40) {
                      title = "Obese Class II";
                      message = bmiCategories["Obese Class II"]!;
                    } else {
                      title = "Obese Class III";
                      message = bmiCategories["Obese Class III"]!;
                    }

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: unpressed,
                            title: Center(
                              child:
                                  Text(title, style: TextStyle(color: pressed)),
                            ),
                            content: Container(
                              height: 350,
                              child: Column(
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    "${BMI.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  SizedBox(height: 100),
                                  Text(
                                    message,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              InkWell(
                                onTap: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pop(),
                                child: Container(
                                    height: 40,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: pressed),
                                    child: Center(
                                        child: Text("Close",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white)))),
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                      height: 40,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.pink),
                      child: Center(
                          child: Text("Calculate",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)))),
                );
              })
            ],
          )),
    );
  }
}
