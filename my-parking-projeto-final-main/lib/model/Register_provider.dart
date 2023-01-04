import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterProvider with ChangeNotifier {
  List<Widget> registers = [].cast<Widget>();

  addRegister(String name, String plate, DateTime date, File? photo) {
    registers.add(
      Register(
        driverName: name,
        licensePlate: plate,
        entryDate: date,
        photo: photo,
      ),
    );
    notifyListeners();
  }
}

class Register extends StatelessWidget {
  const Register(
      {required this.driverName,
      required this.licensePlate,
      required this.entryDate,
      Key? key,
     this.photo})
      : super(key: key);

  final String driverName;
  final String licensePlate;
  final DateTime entryDate;
  final File? photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red[400],


            ),
            width: 450,
            height: 90,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  (photo == null)
                      ? Container(
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: const Icon(
                        Icons.no_photography_outlined,
                        color: Colors.white,
                        size: 30,
                      ))
                      : SizedBox(
                      width: 90,
                      height: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          photo!,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Condutor: $driverName',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Placa: $licensePlate',
                          style: const TextStyle(
                              color: Colors.white,

                              fontSize: 20),
                        ),



                      ],

                    ),

                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
