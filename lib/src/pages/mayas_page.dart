import 'package:flutter/material.dart';

class MayasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cultura Maya'),
      ),
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.green),
          ),
        )
      ]),
    );
  }


  
}
