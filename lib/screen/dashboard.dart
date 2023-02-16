import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thakbe_admin/model/user.dart';
import 'package:thakbe_admin/screen/user_profile.dart';
import 'package:thakbe_admin/services/user_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController phone = TextEditingController();
  TextEditingController msg = TextEditingController();
  var adsMsg = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text("Search by Phone"),
              TextField(
                keyboardType: TextInputType.number,
                controller: phone,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 3),
                    labelText: "Phone",
                    floatingLabelBehavior:
                    FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
              OutlinedButton(

                onPressed: () async {

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserProfiles(phone: phone.text)));
                },
                child: Text("Details",
                    style: TextStyle(
                      fontSize: 16, letterSpacing: 1.2, color: Colors.green,  )),
              ),

              TextField(
                maxLines: 7,
                controller: msg,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ads MSG",
                ),
              ),
              OutlinedButton(

                onPressed: () async {
                  _sendAdsMSG(phone.text, msg);
                },
                child: Text("Send",
                    style: TextStyle(
                      fontSize: 16, letterSpacing: 1.2, color: Colors.green,  )),
              ),

            ],
          ),
        ),
      ),
    );
  }
  UserService _userService = UserService();
  _sendAdsMSG(phone, msg) async {
    var user = User();
    user.phone = phone;
    user.msg = msg.toString();

    var response = await _userService.sendSMS(user);
    var result = json.decode(response.body);

    if(result['result'] == true) {
      _showSnackMessage(Text(
        result['massage'],
        style: const TextStyle(color: Colors.green),
      ));
    } else if (result['result'] == false){
      _showSnackMessage(Text(
        result['massage'],
        style: const TextStyle(color: Colors.red),
      ));
    }
  }
  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
