import 'package:final_project/model/shared.dart';
import 'package:final_project/view/screens/Forms.dart';
import 'package:final_project/view/screens/Home_Screen.dart';
import 'package:final_project/view/screens/Page.dart';

import 'package:final_project/view/screens/viewRegisters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/Register_provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Number(),
        ),
      ],
      child: const MyParking(),
    ),
  );
}

class MyParking extends StatelessWidget {
  const MyParking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const home_screen(),
        '/addPage': (context) => const AddRegisterPage(),
        '/viewRegisterPage': (context) => const ViewRegisterPage(),
        '/numberOfLotsPage': (context) => const NumberOfLotsPage()
      },
    );
  }
}
