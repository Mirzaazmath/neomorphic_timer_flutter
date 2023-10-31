import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neomorphic_timer_flutter/components/digital_number.dart';
import 'package:neomorphic_timer_flutter/services/timer_service.dart';
import 'package:provider/provider.dart';
import 'digital_colon.dart';

class NeoDigitalScreen extends StatelessWidget {
  const NeoDigitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(

        color:
        const Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow:const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-15,-15),
            blurRadius: 15

          ),
          BoxShadow(
              color:  Color.fromRGBO(214, 223, 230, 1),
              offset: Offset(20,20),
              blurRadius: 15

          )
        ]
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context,constraints){
            return Container(
              height: constraints.maxHeight*0.9,
              width: constraints.maxWidth*0.95,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromRGBO(160, 168, 168, 1),width: 2 ),
                gradient:const  LinearGradient(
                  colors: [
                    Color.fromRGBO(203, 211, 196, 1),
                    Color.fromRGBO(176, 188, 165, 1)

                  ]
                )
              ),
              child: Center(
                child: DigitalClock(
                  maxHeight: constraints.maxHeight,
                  maxWidth: constraints.maxWidth,


                ),
              )




            );
          },
        ),
      ),

    );
  }
}
class DigitalClock extends StatelessWidget {
  final double maxHeight;
  final double maxWidth;


  const DigitalClock(
      {super.key, required this.maxHeight, required this.maxWidth,});

  @override
  Widget build(BuildContext context) {
    final duration= Provider.of<TimerService>(context).currentDuration;


    final hours=createNumberTime(duration.inHours);
    final minutes=createNumberTime(duration.inMinutes);
    final seconds=createNumberTime(duration.inSeconds);

    return Container(
        height: maxHeight * 0.5,
        width: maxWidth * 0.7,
        decoration: const BoxDecoration(

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...hours,
            DigitalColon(height: maxHeight*0.3,color: Colors.black87,),
            ...minutes,
            DigitalColon(height: maxHeight*0.3,color: Colors.black87,),
            ...seconds
          ],
        )
    );
  }


  List<ClockNumberWithBG> createNumberTime(int numberTime) {
    final int parsedNumber=numberTime%60;
    final bool isTwoDigit=parsedNumber.toString().length==2;
    final int  firstDigit=isTwoDigit?int.parse(parsedNumber.toString()[0]):0;
    final int  secondDigit=isTwoDigit?int.parse(parsedNumber.toString()[1]):numberTime%60;

    return [
      ClockNumberWithBG(
        height: maxHeight,

        value: firstDigit,
      ),
      ClockNumberWithBG(
        height: maxHeight,

        value: secondDigit,
      )

    ];
  }
}

class ClockNumberWithBG extends StatelessWidget {
  final  double height;

  final int value;

  const ClockNumberWithBG({super.key, required this.height, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [

        DigitalNumber(value: value, height: height*0.4, color: Colors.black,),
        DigitalNumber(value: 8, height: height*0.4, color: Colors.black12,),
      ],
    );
  }
}


