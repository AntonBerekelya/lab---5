import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лічильник з таймером',
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _counter = 0;
  Timer? _timer;

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _timer?.cancel(); // Зупинити таймер
  }

  @override
  void dispose() {
    _timer?.cancel(); // Завершити таймер при виході
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Лічильник з таймером')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Значення лічильника:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('$_counter', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text('Старт'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _resetCounter,
              child: Text('Обнулити'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
