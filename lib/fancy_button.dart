import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData myIconData;
  final String message;

  FancyButton(
      {@required this.onPressed, @required this.myIconData, @required this.message}); //end constructor

  @override
  Widget build(BuildContext _context) {
    return RawMaterialButton(
      fillColor: Colors.deepOrange,
      splashColor: Colors.orange,
      onPressed: onPressed,
      shape: const StadiumBorder(),
      textStyle: TextStyle(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 0,
              child: Icon(IconData(myIconData.codePoint,
                  fontPackage: myIconData.fontPackage,
                  fontFamily: myIconData.fontFamily)),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(message),
          ],
        ),
      ),
    );
  } //end build method

} //end FancyButton class
