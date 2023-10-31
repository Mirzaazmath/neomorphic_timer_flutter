import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/timer_service.dart';
class NeumorphicResetBtn extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Color color;

  NeumorphicResetBtn({

    required this.child,
    this.bevel = 10.0,
    required this.color,
  }) ;


  @override
  _NeumorphicResetBtnState createState() => _NeumorphicResetBtnState();
}

class _NeumorphicResetBtnState extends State<NeumorphicResetBtn> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {

   /// Here we are using the Listener to listen our taps
    return Listener(
      // down
      onPointerDown: (e){
        // calling the reset function
        Provider.of<TimerService>(context, listen: false).reset();
        // if the stopwatch is in running State we simply starting the Stopwatch Again
       if( Provider.of<TimerService>(context, listen: false).isRunning)Provider.of<TimerService>(context, listen: false).start();
        _onPointerDown(e);
      },
      // UP
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),


        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:Theme.of(context).primaryColor,

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors:_isPressed? [Colors.white,const  Color.fromRGBO(214, 223, 230, 1),]:[
               widget.color, widget.color,

              ],),

      /// For NeoMorphic Effect
          boxShadow: _isPressed ? null :const  [
            BoxShadow(
              blurRadius: 15,
              offset:   Offset(-10,-10),
              color: Colors.white,
            ),
            BoxShadow(
              blurRadius: 10,
              offset:  Offset(15,15),
              color:  Color.fromRGBO(214, 223, 230, 1)
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

