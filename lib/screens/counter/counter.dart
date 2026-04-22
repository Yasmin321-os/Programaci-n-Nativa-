import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int clickCounter = 0;
  String clickString = 'clicks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen'), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100,
              ),
            ),

            Text(clickString, style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              setState(() {
                clickCounter++;
                clickString = 'clicks';
              });
            },
            child: const Icon(Icons.plus_one),
          ),

          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              setState(() {
                clickCounter++;
                clickString = clickCounter == 1 ? 'click' : 'clicks';
              });
            },
            icon: Icons.plus_one,
          ),

          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              setState(() {
                clickCounter = 0;
                clickString = 'clicks';
              });
            },
            child: const Icon(Icons.refresh_outlined),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              if (clickCounter == 0) return;

              setState(() {
                clickCounter--;
                clickString = clickCounter == 1 ? 'click' : 'clicks';
              });
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      elevation: 10,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
