import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            //decoration: BoxDecoration(),
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor,
                  fontSize: 34,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500),
            )),
          ),
        ),
      ),
    );
  }
}
