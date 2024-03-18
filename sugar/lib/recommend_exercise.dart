import 'package:flutter/material.dart';
import 'dart:async'; // Import dart:async for Timer class

class RecommendExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Exercises'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Exercises',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ExerciseTile(
              title: 'Running',
              duration: Duration(minutes: 30),
              icon: Icons.directions_run,
              color: Color(0xFFB5DEFF),
            ),
            SizedBox(height: 18),
            ExerciseTile(
              title: 'Cycling' ,
              duration: Duration(minutes: 45),
              icon: Icons.directions_bike,
              color: Color(0xFFCAF2D7),
            ),
            SizedBox(height: 18),
            ExerciseTile(
              title: 'Swimming',
              duration: Duration(minutes: 60),
              icon: Icons.pool,
              color: Color(0xFFE3DFFD),
            ),
            SizedBox(height: 18),
            ExerciseTile(
              title: 'Jumping Jacks',
              duration: Duration(minutes: 20),
              icon: Icons.directions_walk,
              color: Color(0xFFFFE0B2),
            ),
            SizedBox(height: 18),
            ExerciseTile(
              title: 'Yoga',
              duration: Duration(minutes: 40),
              icon: Icons.accessibility,
              color: Color(0xFFC8E6C9),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseTile extends StatefulWidget {
  final String title;
  final Duration duration;
  final IconData icon;
  final Color color;

  const ExerciseTile({
    Key? key,
    required this.title,
    required this.duration,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  _ExerciseTileState createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  bool _isRunning = false;
  late Duration _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds == 0) {
          timer.cancel();
          _isRunning = false;
        } else {
          _remainingTime -= Duration(seconds: 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Set desired height here
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  leading: Icon(widget.icon),
                  title: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold), // Make text bold
                  ),
                  subtitle: _isRunning
                      ? Text(
                      'Remaining Time: ${_remainingTime.inMinutes} min ${_remainingTime.inSeconds.remainder(60)} sec')
                      : Text('Duration: ${widget.duration.inMinutes} minutes'),
                ),
              ),
              _isRunning
                  ? IconButton(
                onPressed: () {
                  _timer.cancel();
                  setState(() {
                    _isRunning = false;
                    _remainingTime = widget.duration;
                  });
                },
                icon: Icon(Icons.stop),
              )
                  : ElevatedButton(
                onPressed: () {
                  _startTimer();
                },
                child: Text('Start'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecommendExercisePage(),
  ));
}
