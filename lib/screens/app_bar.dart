import 'package:flutter/material.dart';
class AppbarTitle extends StatelessWidget {
  final String sectionName;
  const AppbarTitle({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/firebase_logo.png", height: 20,),
        SizedBox(width: 8,),
        Text(
          'FlutterFire ',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 18,
          ),
        ),
        Text(
          '$sectionName',
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 18,
          ),
        ),

      ],
    );
  }
}
