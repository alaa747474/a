import 'package:apiurl/models/User.dart';

import 'package:apiurl/screens/card.dart';
import 'package:apiurl/functions.dart';
import 'package:apiurl/screens/googlemap.dart';

import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          MyCard(
            content: "${widget.user.name}",
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              launchURL("mailto:${widget.user.email}");
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: Center(
                    child: Text(
                  "E-mail : ${widget.user.email}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              launchURL("tel:${widget.user.phone}");
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: Center(
                    child: Text(
                  "phone ; ${widget.user.phone}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              launchURL("https://${widget.user.website}");
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: Center(
                    child: Text(
                  "Site : ${widget.user.website}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ), 

SizedBox(height: 10,),
           InkWell(
            onTap: () {
              pushPage(
                  context,
                  MapSample(
                    userLoaction: widget.user.address.geo,
                  ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.teal[400],
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 70,
                child: Center(
                    child: Text(
                  "LOCATION",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))),
          ),
          /*  MaterialButton(
            onPressed: () {
              pushPage(
                  context,
                  MapSample(
                    userLoaction: widget.user.address.geo,
                  ));
            },
            child: Text("Map view"),
          )*/
        ],
      ),
    );
  }
}
