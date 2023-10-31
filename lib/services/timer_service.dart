
import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerService extends ChangeNotifier{
// Here we are creating _watch variable and assigning the class Stopwatch
  Stopwatch _watch = Stopwatch();
  // Here we are creating the variable Timer to perform operation based on timing
   Timer? _timer;
   // Here we Creating the _currentDuration variable to store the currentDuration
   Duration? _currentDuration;
   // Here we are creating the currentDuration getter to access the _currentDuration in entire app
  Duration get currentDuration=>_currentDuration??Duration.zero;
// Here we  are creating the isRunning bool getter to Know Our Stopwatch State

  bool  get isRunning=>_watch.isRunning;


// This function starts Our StopWatch
void start(){
  // to Start StopWatch
    _watch.start();
    // to Update the _currentDuration we are using _Timer here
    _timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentDuration=_watch.elapsed;
      // it Notify Its Listeners
      notifyListeners();
    });
}
// This function Reset Our StopWatch
 void reset(){
  // Here we are checking our Stopwatch is in running mode
   // if false then stop
  if(!isRunning)_watch.stop();
  // here we are resetting our Stopwatch
  _watch.reset();
  // here we are canceling  our Timer to Prevent Memory Leaks
  _timer?.cancel();
  // Once the Stopwatch is reset we are setting our _currentDuration to Zer0
  _currentDuration=Duration.zero;

  notifyListeners();
 }
  // This function Stops Our StopWatch
  void stop(){

    _watch.stop();
    _currentDuration=_watch.elapsed;
    notifyListeners();
  }

  notifyListeners();

}