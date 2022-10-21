import 'dart:io';
import 'package:flutter/material.dart';
import 'package:registetionpageuidesign/datastorfile/share_prifarance_store_controall.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? firstname;
  String? lastname;
  String? phone;
  String? gmail;
  File ?images;
  @override
  void initState() {
    firstname=UserShareControallar().getFirstName();
    lastname=UserShareControallar().getLastName();
    phone=UserShareControallar().getPhoneNumber();
    gmail=UserShareControallar().getEmail();
    images=UserShareControallar().getImage();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("Images____${images}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child:  Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown,width: 5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100))
                ),
                child: ClipOval(
                  child: Image?.file(images!,

                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,),
                ),

              ),
            ),
            SizedBox(height: 15,),

            Row(
              children: [
                Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("${firstname} ${lastname}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Phone:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("${phone}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Gmail:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("${gmail}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            )


          ],
        ),
      ),
    );
  }
}
