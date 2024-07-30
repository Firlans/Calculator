import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{
  final String text;
  final VoidCallback activity;

  CustomButton({required this.text, required this.activity});

  @override
  State<CustomButton> createState() => _CustomButton();
}

class _CustomButton extends State<CustomButton>{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: ElevatedButton(
        onPressed: widget.activity,
        child: Text(widget.text),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            textStyle: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            shadowColor: Color.fromRGBO(0, 0, 0, .8),
            elevation: 5,
            minimumSize: Size(50, 50)
        ),
      )
    );
  }
}
