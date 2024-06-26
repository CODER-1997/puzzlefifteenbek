import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puzzle_fifteen/game_screen.dart';
import 'package:puzzle_fifteen/records_page.dart';

import 'about_page.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF57407C),
      appBar: AppBar(
        backgroundColor: Color(0xFF57407C),
        elevation: 0, // Remove shadow from the AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Get.to(PuzzleHomePage());
              },
              child: CustomButton(
                title: 'PLAY',
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Get.to(RecordsPage());
                },
                child: CustomButton(title: "RECORDS")),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  Get.to(AboutPage());
                },
                child: CustomButton(title: "ABOUT")),
            SizedBox(height: 20),
            CustomButton(title: "QUIT"),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final double ? radius;

  CustomButton({required this.title,  this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff443069),
        borderRadius: BorderRadius.circular(radius ?? 0)
      ),
        alignment: Alignment.center,
        width: Get.width - 64,
        padding: EdgeInsets.all(16),
        child: Text(
          title,
          style: TextStyle(color: CupertinoColors.white),
        ));
  }
}
