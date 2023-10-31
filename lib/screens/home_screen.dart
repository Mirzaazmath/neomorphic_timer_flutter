import 'package:flutter/material.dart';
import 'package:neomorphic_timer_flutter/services/timer_service.dart';
import '../components/center_pie.dart';
import '../components/neo_digital_screen.dart';
import '../components/neo_hamburger_btn.dart';
import 'package:provider/provider.dart';
import '../components/neo_reset_btn.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Using the ChangeNotifierProvider to handle the state
    return ChangeNotifierProvider<TimerService>(
      create: (_)=>TimerService(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // This Sized box is for Top Notch
              SizedBox(height: MediaQuery.of(context).viewPadding.top,),
              const SizedBox(height: 20,),
              Row(
                children: [
                 const  Text("Timer",style: TextStyle(fontSize: 43,color: Color.fromRGBO(49, 68, 105, 1),fontWeight: FontWeight.bold),),
                 const  Spacer(),
                  // Menu
                  NeumorphicHumburgerBtn(),
                ],
              ),
              const Spacer(),
             // Digital Clock
             const  NeoDigitalScreen(),
              const Spacer(),
              // Progress Pie
              const CenterProgressPie(),
             const Spacer(),
              const Spacer(),
              // Reset Button
              NeumorphicResetBtn(
                color: Theme.of(context).primaryColor,
              child:const  Center(child:   Text("RESET",style: TextStyle(fontSize: 22,color: Color.fromRGBO(49, 68, 105, 1),fontWeight: FontWeight.w700),),),

              ),
              const SizedBox(height: 30,),


            ],
          ),
        ),
      ),
    );
  }
}
