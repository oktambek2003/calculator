import 'package:flutter/material.dart';

ButtonStyle style() {
  return ButtonStyle(
    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white)),
    backgroundColor: MaterialStateProperty.all( Colors.black),
    );
}
