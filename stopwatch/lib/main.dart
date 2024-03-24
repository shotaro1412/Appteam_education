import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

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

class StopwatchModel extends ChangeNotifier {
  bool _isRunning = false;
  double _counter = 0.0;
  late Timer _timer;

  bool get isRunning => _isRunning;
  double get counter => _counter;

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      _counter += 0.1;
      notifyListeners(); 
    });
    _isRunning = true;
    notifyListeners();
  }

  void stopTimer() {
    _timer.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _counter = 0.0;
    notifyListeners();
  }
}



class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stopwatch'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<StopwatchModel>(
                builder: (context, model, _) => Text(
                  '${model.counter.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!context.read<StopwatchModel>().isRunning) {
                        context.read<StopwatchModel>().startTimer();
                      }
                    },
                    child: Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (context.read<StopwatchModel>().isRunning) {
                        context.read<StopwatchModel>().stopTimer();
                      }
                    },
                    child: Text('Stop'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StopwatchModel>().resetTimer();
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
