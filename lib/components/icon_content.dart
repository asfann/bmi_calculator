import 'package:flutter/material.dart';
import '../../constants.dart';


class ReusableGender extends StatelessWidget {
  ReusableGender({@required this.icon, @required this.gender});
  final IconData icon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender,
          style: kLabel)
      ],
    );
  }
}
