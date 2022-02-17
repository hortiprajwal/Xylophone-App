import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey({Color color, int soundNumber, String letter, double rightspace}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(rightspace, 2.0, rightspace, 2.0),
      padding: EdgeInsets.all(0.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        height: 75.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$letter',
              style: TextStyle(
                color: Colors.white.withOpacity(0.90),
                fontSize: 20.0,
              ),
            ),
            Icon(
              Icons.music_note_rounded,
              color: Colors.white.withOpacity(0.90),
            ),
          ],
        ),
        hoverElevation: 50.0,
        color: color,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade300.withOpacity(0.30),
          elevation: 0.0,
          title: Text(
            'Xylophone',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontFamily: 'Lobster',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.music_note_rounded,
              color: Colors.pink,
              size: 35.0,
            ),
            onPressed: () {
              playSound(0);
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildKey(color: Colors.red.shade900, soundNumber: 1, letter: 'C', rightspace: 10.0),
                buildKey(color: Colors.orange.shade900, soundNumber: 2, letter: 'D', rightspace: 20.0),
                buildKey(color: Colors.yellow.shade800, soundNumber: 3, letter: 'E', rightspace: 30.0),
                buildKey(color: Colors.green.shade900, soundNumber: 4, letter: 'F', rightspace: 40.0),
                buildKey(color: Colors.teal.shade500, soundNumber: 5, letter: 'G', rightspace: 50.0),
                buildKey(color: Colors.blue.shade600, soundNumber: 6, letter: 'A', rightspace: 60.0),
                buildKey(color: Colors.purple.shade600, soundNumber: 7, letter: 'B', rightspace: 70.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
