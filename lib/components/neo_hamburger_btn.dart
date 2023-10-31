
import 'package:flutter/material.dart';
class NeumorphicHumburgerBtn extends StatefulWidget {
  NeumorphicHumburgerBtn();





  @override
  _NeumorphicHumburgerBtnState createState() => _NeumorphicHumburgerBtnState();
}

class _NeumorphicHumburgerBtnState extends State<NeumorphicHumburgerBtn> {
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


    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),


        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:Theme.of(context).primaryColor,

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors:_isPressed? [Colors.white,const  Color.fromRGBO(214, 223, 230, 1),]:[
              Theme.of(context).primaryColor,Theme.of(context).primaryColor,

            ],),


          boxShadow: _isPressed ? null :const  [
            BoxShadow(
              blurRadius: 10,
              offset:   Offset(-5,-5),
              color: Colors.white,
            ),
            BoxShadow(
                blurRadius: 10,
                offset:  Offset(5,5),
                color:  Color.fromRGBO(214, 223, 230, 1)
            )
          ],
        ),
       child:  Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
         for(int i =0;i<3;i++)...[
           Container(
           height: 3,
           width: 25,
           margin: EdgeInsets.only(top: i==0 ? 0:4),
           decoration: const BoxDecoration(
               color: Color.fromRGBO(214, 223, 230, 1)
           ),
         )]

        ],
      ),
      ),
    );
  }
}

