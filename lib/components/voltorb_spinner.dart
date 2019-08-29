import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class VoltorbSpinner extends StatefulWidget {
  @override
  _VoltorbSpinnerState createState() => _VoltorbSpinnerState();
}

class _VoltorbSpinnerState extends State<VoltorbSpinner> with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    
   controller = AnimationController( 
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    
    super.initState();

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                child: Image.asset("assets/misc/spinner_voltorb.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text("Waiting for Arceus's permission..."),
            )
          ],
        )
      ),
    );
  }
}