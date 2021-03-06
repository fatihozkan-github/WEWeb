import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool showBorder = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: showBorder
              ? Border(
                  bottom: BorderSide(color: Colors.white, width: 2),
                )
              : null,
        ),
        child: InkWell(
          onTap: () {},
          onHover: (hovered) {
            setState(() {
              showBorder = hovered;
            });
          },
          child: TextButton(
            onPressed: () {
              print('Text button pressed');
            },
            child: Text('Button'),
          ),
        ),
      ),
    );
  }
}
