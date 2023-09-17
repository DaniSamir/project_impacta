import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textFieldCustom(String labelText, Icon iconType) {
  return InputDecoration(
    //filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(
        20.0,
      )),
      borderSide: BorderSide(color: Colors.white, width: 4.0),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.white, width: 2.0),
    ),
    prefixIcon: iconType,
    labelText: labelText,

    labelStyle: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(
    fontSize: 17.0,
    color: Colors.white,
  );
}

RoundedRectangleBorder raisedButtonBorder() {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));
}
