import 'package:flutter/material.dart';

textButton(onPressed, String text, bool isUnderline) {
  if (isUnderline) {
    return TextButton(
      onPressed: (onPressed),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationThickness: 3),
      ),
    );
  } else {
    return TextButton(
        onPressed: (onPressed),
        child: Text(text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )));
  }
}
