
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';


class UserShareControallar{

 static SharedPreferences?sharedPreferences;

  Future InstansControall()async{
    sharedPreferences= await SharedPreferences.getInstance();
  }

  Future setFirstName(String firstname)async{
    return await sharedPreferences!.setString("FirstName", firstname);
  }

  getFirstName(){
    return sharedPreferences!.getString("FirstName");
  }

  Future setLasttName(String lastname)async{
    return await sharedPreferences!.setString("LastName", lastname);
  }

  getLastName(){
    return sharedPreferences!.getString("LastName");
  }

  Future setPhonNumber(String phonenumber)async{
    return await sharedPreferences!.setString("PhoneNumber", phonenumber);
  }

  getPhoneNumber(){
    return sharedPreferences!.getString("PhoneNumber");
  }

  Future setEmail(String email)async{
    return await sharedPreferences!.setString("Email", email);
  }

  getEmail(){
    return sharedPreferences!.getString("Email");
  }
 Future setImage(String image)async{
   return await sharedPreferences!.setString("Image", image);
 }

 getImage(){
   return sharedPreferences!.getString("Image");
 }





}