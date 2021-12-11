// ignore_for_file: prefer_const_constructors

import 'package:calculadora/components/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  Calculadora({Key? key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController controller = TextEditingController(text: '');
  String? valueA;
  String? operator;

  _clean() {
    setState(() {
      controller.clear();
    });
  }

  _setValue(int value) {
    setState(() {
      controller.text = controller.text + value.toString();
    });
  }

  _setOperator(String value) {
    if (operator == null) {
      operator = value;
      valueA = controller.text.replaceAll(RegExp(r','), '.');

      setState(() {
        controller.text = '';
      });
    }
  }

  _calResult() {
    final String valueB = controller.text.replaceAll(RegExp(r','), '.');
    final double a = valueA != null ? double.parse(valueA!) : 0;
    final double b = valueB != null ? double.parse(valueB) : 0;
    if (operator == '%') {
      controller.text = (a % b).toString().replaceAll(RegExp(r'.0'), '');
    }
    if (operator == '/') {
      controller.text = (a / b).toString().replaceAll(RegExp(r'.0'), '');
    }
    if (operator == 'x') {
      controller.text = (a * b).toString().replaceAll(RegExp(r'.0'), '');
    }
    if (operator == '-') {
      controller.text = (a - b).toString().replaceAll(RegExp(r'.0'), '');
    }
    if (operator == '+') {
      controller.text = (a + b).toString().replaceAll(RegExp(r'.0'), '');
    }
    valueA = null;
    operator = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 60, 16, 10),
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                    textAlign: TextAlign.end,
                    readOnly: true,
                    enabled: false,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CButton(
                      label: 'AC',
                      color: Color.fromRGBO(117, 117, 117, 1),
                      onPress: _clean,
                    ),
                    CButton(
                      label: 'C',
                      color: Color.fromRGBO(117, 117, 117, 1),
                      onPress: () {
                        setState(() {
                          controller.text = controller.text
                              .substring(0, controller.text.length - 1);
                        });
                      },
                    ),
                    CButton(
                      label: '%',
                      color: Color.fromRGBO(117, 117, 117, 1),
                      onPress: () {
                        _setOperator('%');
                      },
                    ),
                    CButton(
                      label: '/',
                      color: Color.fromRGBO(255, 179, 0, 1),
                      onPress: () {
                        _setOperator('/');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CButton(
                      label: '7',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(7);
                      },
                    ),
                    CButton(
                      label: '8',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(8);
                      },
                    ),
                    CButton(
                      label: '9',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(9);
                      },
                    ),
                    CButton(
                      label: 'X',
                      color: Color.fromRGBO(255, 179, 0, 1),
                      onPress: () {
                        _setOperator('x');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CButton(
                      label: '4',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(4);
                      },
                    ),
                    CButton(
                      label: '5',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(5);
                      },
                    ),
                    CButton(
                      label: '6',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(6);
                      },
                    ),
                    CButton(
                      label: '-',
                      color: Color.fromRGBO(255, 179, 0, 1),
                      onPress: () {
                        _setOperator('-');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CButton(
                      label: '1',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(1);
                      },
                    ),
                    CButton(
                      label: '2',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(2);
                      },
                    ),
                    CButton(
                      label: '3',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(3);
                      },
                    ),
                    CButton(
                      label: '+',
                      color: Color.fromRGBO(255, 179, 0, 1),
                      onPress: () {
                        _setOperator('+');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CButton(
                      label: '0',
                      largeButton: true,
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        _setValue(0);
                      },
                    ),
                    CButton(
                      label: ',',
                      color: Color.fromRGBO(39, 39, 39, 1),
                      onPress: () {
                        setState(() {
                          if (!controller.text.contains(',')) {
                            controller.text = controller.text + ',';
                          }
                        });
                      },
                    ),
                    CButton(
                      label: '=',
                      color: Color.fromRGBO(255, 179, 0, 1),
                      onPress: _calResult,
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
