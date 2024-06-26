import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF57407C),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: CupertinoColors.white,),
        ),
      ),
      backgroundColor: Color(0xFF57407C),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            padding: EdgeInsets.all(32.0),
            color: Color(0xFF443069),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Maksimum ball: 0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}