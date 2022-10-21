import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:registetionpageuidesign/datastorfile/share_prifarance_store_controall.dart';
import 'package:registetionpageuidesign/screen/profile_detelspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final TextEditingController firstnamecontroalar=TextEditingController();
   final TextEditingController lastnamecontroalar=TextEditingController();
   final TextEditingController phoneNumbercontroalar=TextEditingController();
   final TextEditingController emailcontroalar=TextEditingController();
   @override
  void initState() {
   firstnamecontroalar.text=UserShareControallar().getFirstName();
   lastnamecontroalar.text=UserShareControallar().getLastName();
   phoneNumbercontroalar.text=UserShareControallar().getPhoneNumber();
   emailcontroalar.text=UserShareControallar().getEmail();
    super.initState();

  }

  File?_images;
  Future picImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        _images = tempImage;
      });
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void ImagePicOption() {
    Get.bottomSheet(
      SingleChildScrollView(
          child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: Container(
          height: 250,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                const Text(
                  "Pic Image Frome",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.camera),
                  label: Text("Camera"),
                  onPressed: () {
                    picImage(ImageSource.camera);
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      picImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.image),
                    label: Text("Gellary")),
                SizedBox(height: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.redAccent,
                    ),
                    label: Text("CANCEL"))
              ],
            ),
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Registration",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height:10),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: ClipOval(
                        child: _images != null
                            ? Image.file(_images!)
                            : Container(),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 5,
                        child: IconButton(
                            onPressed: () {
                              picImage(ImageSource.camera);
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.teal,
                              size: 40,
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.camera),
                  label: Text("Upload Image"),
                  onPressed: () {
                    ImagePicOption();
                  },
                ),
              ),

              Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                readOnly: false,
                controller: firstnamecontroalar,
                  decoration:const InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                    hintText: "First Name",
                    labelText: "First Name",
                    hintStyle: TextStyle(color: Colors.black45,fontSize: 10,fontStyle: FontStyle.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      )
                    )
                  ),
                ),
            ),
             Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: lastnamecontroalar,
                  decoration:const InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.grey,),
                      hintText: "Last Name",
                      labelText: "Last Name",
                      hintStyle: TextStyle(color: Colors.black45,fontSize: 10,fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )
                      )
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: phoneNumbercontroalar,
                  decoration:const InputDecoration(
                      prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                      hintText: "Phone",
                      labelText: "Phone",
                      hintStyle: TextStyle(color: Colors.black45,fontSize: 10,fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                
                child: TextField(
                  controller: emailcontroalar,
                  decoration:const InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.grey,),
                      hintText: "Email",
                      labelText: "Email",
                      hintStyle: TextStyle(color: Colors.black45,fontSize: 10,fontStyle: FontStyle.normal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed:()async{
                  await UserShareControallar().setFirstName(firstnamecontroalar.text);
                  await UserShareControallar().setLasttName(lastnamecontroalar.text);
                  await UserShareControallar().setPhonNumber(phoneNumbercontroalar.text);
                  await UserShareControallar().setEmail(emailcontroalar.text);
                  await UserShareControallar().setImage(_images!.path);
                  Get.to(ProfilePage());
                  Get.snackbar("Register", "Registration Successfull",backgroundColor: Colors.redAccent);
                },
                    child: Text("Register")),
              )
            ],),
        ));
  }
}
