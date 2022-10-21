import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registetionpageuidesign/datastorfile/share_prifarance_store_controall.dart';
import 'screen/registetionpage.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserShareControallar().InstansControall();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

