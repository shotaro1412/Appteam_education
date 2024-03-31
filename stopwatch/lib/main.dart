import 'package:flutter/material.dart';
import 'dart:async';
//setstate版


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StopwatchApp(),
    );
  }
}

class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  bool isRunning = false;
  double counter = 0.0;
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) { 
      setState(() {
        counter += 0.1; 
      });
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void resetTimer() {
    setState(() {
      counter = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${counter.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!isRunning) {
                      startTimer();
                      setState(() {
                        isRunning = true;
                      });
                    }
                  },
                  child: Text('Start'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (isRunning) {
                      stopTimer();
                      setState(() {
                        isRunning = false;
                      });
                    }
                  },
                  child: Text('Stop'),
                ),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
