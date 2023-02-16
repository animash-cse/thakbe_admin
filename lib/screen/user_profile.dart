import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thakbe_admin/model/user.dart';
import 'package:thakbe_admin/services/user_service.dart';

class UserProfiles extends StatefulWidget {
  final String phone;
  const UserProfiles({ Key? key, required this.phone}) : super(key: key);

  @override
  State<UserProfiles> createState() => _UserProfilesState();
}

class _UserProfilesState extends State<UserProfiles> {

  TextEditingController trust = TextEditingController();
  TextEditingController trustRange = TextEditingController();
  TextEditingController badgeId = TextEditingController();
  List<User> _user = [];
  UserService _userService = UserService();
  var model = User();
  @override
  void initState()  {
    super.initState();
    _userDetails(widget.phone);
  }

  _userDetails(phone) async {
    var user = await _userService.httpGetUser(phone);
    var result = json.decode(user.body);

    print(result);
    model = User();
    result['data'].forEach((data) {
      model.name = data['name'].toString();
      model.image_url = data['image_url'].toString();
      model.phone = data['phone'].toString();
      model.address = data['address'].toString();
      model.trust = data['trust'];
      model.trust_range = data['trust_range'].toString();
      //model.badge_name = data['badge_info'][1]; // fullpikpic
      data['badge_info'].forEach((info) {
        model.badge_name = info['badge_name'];
      });
      setState(() {
        _user.add(model);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: _user.isEmpty?CircularProgressIndicator():ListView(
          children: [
              Text("Name: "+model.name),
              Text("Phone: 0"+model.phone),
              Text("Address: "+model.address),
              Text("Trust By: "+model.trust_range),
              Text("Badge Name: "+model.badge_name),
            const SizedBox(height: 25,),
            TextField(
              keyboardType: TextInputType.number,
              controller: trust,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  labelText: "Is Trust",
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  hintText: "1/0",
                  ),
            ),
            const SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.text,
              controller: trustRange,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                  labelText: "Trust By",
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  hintText: "Trust By/Range",
                  ),
            ),
            const SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.number,
              controller: badgeId,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                  labelText: "Badge ID",
                  floatingLabelBehavior:
                  FloatingLabelBehavior.always,
                  hintText:  "Badge ID: 1,2,3...",
                 ),
            ),
          ],
        ),
      )
    );
  }
}
