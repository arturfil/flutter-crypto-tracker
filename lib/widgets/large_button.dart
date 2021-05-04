import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Function func;
  final String title;

  const LargeButton({
    Key key,
    @required this.func,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xff07f2a0),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          onPressed: func,
        ),
      ),
    );
  }
}
