import 'dart:async';
import 'dart:io';
import 'dart:convert';


void main() {
  double counter = 0.0;
  bool isRunning = false;
  Timer? timer;

  stdin
      .transform(utf8.decoder)
      .listen((String line) {
    switch (line.trim()) {
      case '1':
        if (!isRunning) {
          print('Start');
          timer = Timer.periodic(Duration(milliseconds: 1000), (Timer t) {
            counter += 1.0;
            print('Counter: $counter\n 1 satrt |2 stop |3 restart');
          });
          isRunning = true;
        }
        break;
      case '2':
        if (isRunning) {
          print('Pause');
          timer?.cancel();
          isRunning = false;
          print('Elapsed time: $counter\n 1 satrt |2 stop |3 restart');
        }
        break;
      default:
        print('Invalid input');
    }
  });
}
