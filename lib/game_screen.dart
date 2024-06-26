import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_fifteen/main_page.dart';

class PuzzleHomePage extends StatefulWidget {
  @override
  _PuzzleHomePageState createState() => _PuzzleHomePageState();
}

class _PuzzleHomePageState extends State<PuzzleHomePage> {
  List<int> tiles = List<int>.generate(16, (index) => index);
  int moveCount = 0;
  late Timer _timer;
  int _seconds = 0;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    tiles.shuffle();
    _startTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  void moveTile(int index) {
    if (canMove(index)) {
      setState(() {
        int emptyIndex = tiles.indexOf(0);
        tiles[emptyIndex] = tiles[index];
        tiles[index] = 0;
        moveCount++;

      });
    }
  }

  bool canMove(int index) {
    int emptyIndex = tiles.indexOf(0);
    int row = index ~/ 4;
    int col = index % 4;
    int emptyRow = emptyIndex ~/ 4;
    int emptyCol = emptyIndex % 4;

    return (row == emptyRow && (col - emptyCol).abs() == 1) ||
        (col == emptyCol && (row - emptyRow).abs() == 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff57407C),
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xff57407C),
      ),
      body: Container(
        height: Get.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Text('Moves: $moveCount',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Text('Time: ${_seconds}s',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                height: Get.height / 2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => moveTile(index),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff47326C),
                            borderRadius: BorderRadius.circular(9)),
                        child: Center(
                          child: Text(
                            tiles[index] == 0 ? '' : '${tiles[index]}',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CustomButton(
                            title: 'Finish',
                            radius: 16,
                          )),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              tiles.shuffle();
                              _timer.cancel();
                              _startTimer();
                              _seconds = 0;
                              moveCount = 0;
                            });
                          },
                          child: CustomButton(
                            title: 'Restart',
                            radius: 16,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
