import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData myIconData;
  final String message;
  final double scale;

  FancyButton(
      {@required this.onPressed,
      @required this.myIconData,
      @required this.message,
      this.scale = 1.0}); //end constructor

  @override
  Widget build(BuildContext _context) {
    return RawMaterialButton(
      fillColor: Colors.blueGrey[900],
      splashColor: Colors.blueGrey[900],
      onPressed: onPressed,
      shape: const StadiumBorder(),
      textStyle: TextStyle(color: Colors.blueGrey[50]),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8 * scale,
          horizontal: 20 * scale,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 0,
              child: Icon(
                  IconData(myIconData.codePoint,
                      fontPackage: myIconData.fontPackage,
                      fontFamily: myIconData.fontFamily),
                  size: 24 * scale),
            ),
            SizedBox(
              width: 8.0 * scale,
            ),
            Text(
              message,
              style: Theme.of(_context)
                  .textTheme
                  .body2
                  .copyWith(fontSize: 12 * scale),
            ),
          ],
        ),
      ),
    );
  } //end build method

} //end FancyButton class
