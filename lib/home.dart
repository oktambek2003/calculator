import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica/buttonStyle.dart';
import 'package:practica/buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String types = "";
  @override
  @override
  Widget build(BuildContext context) {
    String resault() {
      String temp = "/*-+%";

      List<int> ind = [];
      List<num> numbers = [];
      for (int i = 0; i < types.length; i++) {
        if (temp.contains(types[i])) {
          ind.add(i);
        }
      }
      int q = 0;
      for (int i in ind) {
        numbers.add(num.parse(types.substring(q, i)));
        q = i + 1;
      }
      numbers.add(num.parse(types.substring(q, types.length)));
      for (int i = 0; i < temp.length; i++) {
        for (int j = 0; j < ind.length; j++) {
          if (temp[i] == types[ind[j]]) {
            if (temp[i] == "+") {
              numbers[j] = numbers[j] + numbers[j + 1];
            }
            if (temp[i] == "-") {
              numbers[j] = numbers[j] - numbers[j + 1];
            }
            if (temp[i] == "*") {
              numbers[j] = numbers[j] * numbers[j + 1];
            }
            if (temp[i] == "/") {
              numbers[j] = numbers[j] / numbers[j + 1];
            }
            if (temp[i] == "%") {
              numbers[j] = numbers[j] % numbers[j + 1];
            }
            numbers.removeAt(j + 1);
            ind.removeAt(j);
            j--;
          }
        }
      }
      types = numbers[0].toString();
      return types;
    }

    Widget Button({required String type, required Color color}) {
      return TextButton(
          style: style(),
          onPressed: () {
            setState(() {
              types += type;
            });
          },
          child: CircleAvatar(
              radius: 35,
              backgroundColor: Color.fromARGB(255, 34, 33, 33),
              child: Text(
                type,
                style: TextStyle(
                    color: color, fontSize: 24, fontWeight: FontWeight.w700),
              )));
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextField(
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                      hintText: types,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ],
            )),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    ListTile(
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 1,
                            width: 550,
                            color: Color.fromARGB(255, 75, 73, 73),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                types = types.substring(0, types.length - 1);
                              });
                            },
                            icon: Icon(
                              Icons.backspace,
                              color: Colors.green,
                            )),
                        title: Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.schedule,
                              color: Color.fromARGB(221, 121, 115, 115)),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.view_module,
                            color: Colors.white,
                          )
                        ])),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                types = "";
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "C",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "()", color: Colors.green),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "." ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  types = types.substring(0, types.length - 1);
                                  types += "%";
                                } else {
                                  types += "%";
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "%",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "." ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  types = types.substring(0, types.length - 1);
                                  types += "/";
                                } else {
                                  types += "/";
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "/",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "7", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "8", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "9", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "." ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  types = types.substring(0, types.length - 1);
                                  types += "*";
                                } else {
                                  types += "*";
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "4", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "5", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "6", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "." ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  types = types.substring(0, types.length - 1);
                                  types += "-";
                                } else {
                                  types += "-";
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "1", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "2", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "3", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "." ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  if (types.contains("."!)) {
                                    types =
                                        types.substring(0, types.length - 1);
                                    types += "+";
                                  }
                                } else {
                                  types += "+";
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "+/-", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        Button(type: "0", color: Colors.white),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                if (types[types.length - 1] == "." ||
                                    types[types.length - 1] == "*" ||
                                    types[types.length - 1] == "/" ||
                                    types[types.length - 1] == "%" ||
                                    types[types.length - 1] == "-" ||
                                    types[types.length - 1] == "+") {
                                  if (types.contains(".")) {
                                  } else {
                                    types =
                                        types.substring(0, types.length - 1);
                                    types += ".";
                                  }
                                } else {
                                  if ((types.contains("."))) {
                                  } else {
                                    types += ".";
                                  }
                                }
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  ".",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                ))),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                resault();
                              });
                            },
                            child: CircleAvatar(
                                radius: 35,
                                backgroundColor:
                                    Color.fromARGB(255, 34, 33, 33),
                                child: Text(
                                  "=",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                                )))
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
