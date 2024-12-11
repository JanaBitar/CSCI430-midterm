// Jana Bitar 
// 12310111

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSCI410 Midterm',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _timeController = TextEditingController();
  String _result = "";
  bool _convertToMinutes = false;

  @override
  void dispose() {
    super.dispose();
    _timeController.dispose();
  }

  void updateTime() {
    try {
      int hours = int.parse(_timeController.text);
      if (_convertToMinutes) {
        int result = hours * 60; 
        _result = 'Time in minutes: $result';
      } else {
        int result = hours * 3600; 
        _result = 'Time in seconds: $result';
      }
    } catch (e) {
      _result = 'Please enter a valid number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate Time'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              _result,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 230,
              height: 60,
              child: TextField(
                controller: _timeController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter time in hours',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Text('Check to get time in minutes'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _convertToMinutes,
                      onChanged: (bool? value) {
                        setState(() {
                          _convertToMinutes = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  updateTime();
                });
              },
              child: const Text(
                'Calculate Time',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
