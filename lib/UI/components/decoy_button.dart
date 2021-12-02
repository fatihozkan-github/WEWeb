import 'package:we_web/UI/design_material/DM_colors.dart';
import 'package:flutter/material.dart';

class DecoyButton extends StatelessWidget {
  final String title;
  DecoyButton({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Text(title, style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(color: UIColors.primaryColor, borderRadius: BorderRadius.circular(15.0)),
    );
  }
}
