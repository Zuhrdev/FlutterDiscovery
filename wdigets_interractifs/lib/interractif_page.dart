//import 'package:flutter/cupertino.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';

class InterractifPage extends StatefulWidget {

  @override
  /*State<StatefulWidget> createState() {
    return InterractifPageState();
  }*/
  InterractifPageState createState() => InterractifPageState();
}

class InterractifPageState extends State<InterractifPage> {

  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color iconColor = Colors.white;
  Color backgroundIconColor = Colors.black;
  bool textButtonPressed = false;
  IconData iconData = Icons.favorite;
  String prenom = "";
  late TextEditingController controller;
  bool switchValue = true;
  double sliderValue = 50;
  bool checkBoxValue = false;
  Map<String, bool> courses = {
    "carottes": false,
    "oignons": false,
    "frommage": true,
  };
  int groupValue = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    // ce que l'on va faire pendant l'initialisation du widget
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
    //tout ce que l'on va faire quand le widget sera dispose (quand le widget sera supprimé)
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: Text(updateAppBarText()),),
      body: Center(child: Column(
        children: [
          TextButton(onPressed: updateAppBar, style: TextButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Colors.red) ,
              child: Row(
                children: [
                  Icon(Icons.add),
                  textButtonText(),
                ],)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 10,
              side: BorderSide(color: Colors.black),),
              onPressed: () {
              print("pressed");
              },
              child: const Text("Elevaated"),
              onLongPress: () {
                print("long");
              },),
          IconButton(
              onPressed: clingIconButton,
              icon: Icon(iconData,),
            color: Colors.pink,
            splashColor: Colors.deepPurpleAccent,
          ),
          TextField(
            obscureText: true, // utile pour les password
            decoration: InputDecoration(
                hintText: "entrez votre mot de passe",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
            keyboardType: TextInputType.phone,
            onChanged: (newString) {
            setState(() {
              prenom = newString;
            });},
          ),
          Text(prenom),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "entrez votre prenom"),
            onChanged: ((newValue) =>  setState(() => print("done : $newValue"))) // print("Done : $newValue")){
              //setState(() {
                //controller = newValue;
          ),
          Text(controller.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(padding: EdgeInsets.only(left: 20), child: Text((switchValue)? "Vous êtes localisés": "Votre GPS n'est pas activé"),),
              Switch(activeColor : Colors.green, value: switchValue, onChanged: ((bool) {setState(() { switchValue = bool ;});})),
            ],
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            thumbColor: Colors.pink,
            inactiveColor: Colors.blueGrey,
            activeColor: Colors.greenAccent,
            onChanged: ((newValue) {
              setState(() {
                sliderValue = newValue;
              });
            }),
          ),
          Text("Value : ${sliderValue.toInt()}"),
          Checkbox(value: checkBoxValue, onChanged: ((newBool) => setState(() => checkBoxValue = newBool ?? false))),
          checks(),
          Radio(value: 0, groupValue: groupValue, onChanged: ((newValue) {
            setState(() {
              groupValue = newValue as int;
            });
          })),
          radios(),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundIconColor,
        onPressed: updateColors,
        child: Icon(Icons.build, color: iconColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor = (backgroundColor == Colors.white) ? Colors.black: Colors.white;
      backgroundIconColor = (backgroundIconColor == Colors.black) ? Colors.white: Colors.black;
      iconColor = (iconColor == Colors.white) ? Colors.black: Colors.white;
      textColor= (textColor == Colors.black) ? Colors.white: Colors.black;
    });
  }

  updateAppBar() {
    //setState(() => textButtonPressed = !textButtonPressed);
    setState(() {
      textButtonPressed = (textButtonPressed == false) ? true: false;
    });
  }

 String updateAppBarText() {
    return (textButtonPressed)? "Bouton pressé": "Bouton a l'arret";
  }

  clingIconButton() {
    setState(() {
      iconData = (iconData == Icons.favorite) ? Icons.favorite_border: Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> items = [];
    courses.forEach((course, chaseOrNo) {
      Widget row = Row(children: [
        Padding(padding: EdgeInsets.only(left: 10), child: Text(course),),
        Checkbox(value: chaseOrNo, onChanged: ((newValue) {
          setState(() {
            courses[course] = newValue ?? false;
          });
        }))
      ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );
      items.add(row);
    });
    return Column(children: items);
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio r = Radio(value: i, groupValue: groupValue, onChanged: ((newValue) {
        setState(() {
          groupValue = newValue as int;
        });
      }));
      radios.add(r);
    }
    return Row(children: radios,);
  }



  Text textButtonText() {
    return const Text("Je suis la",
      style: TextStyle(
          //color: Colors.black,
          //backgroundColor: Colors.grey
      ),
    );
  }

}