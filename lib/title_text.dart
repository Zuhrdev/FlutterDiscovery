import 'package:flutter/material.dart';

class MainTitleText extends Text {
  final String data;

  MainTitleText({super.key, required this.data}): super(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
      )
  );
}