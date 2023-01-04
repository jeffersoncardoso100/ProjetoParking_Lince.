import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/Register_provider.dart';

class ViewRegisterPage extends StatelessWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<RegisterProvider>(context, listen: false).registers;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Patio',
            style: TextStyle(fontSize: 20),
          ),


          backgroundColor: Colors.white12,
        ),
        

        body: ListView(
          children: list
        )

    );
  }
}

