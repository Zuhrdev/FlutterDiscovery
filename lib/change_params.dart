import 'package:flutter/material.dart';
import 'title_text.dart';

class ExerciseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExerciseWidgetState();
  }
}
  
  class ExerciseWidgetState extends State<ExerciseWidget> {

  Color backGroundColor = Colors.white;
  late TextEditingController controllerSurname;
  late TextEditingController controllerName;
  late TextEditingController controllerSecret;
  late TextEditingController controllerTest;
  bool switchGenderValue = false;
  String prenom = "";
  String name = "";
  String secret = "";

  @override
  void initState() {
    controllerSurname = TextEditingController();
    controllerName = TextEditingController();
    controllerSecret = TextEditingController();
    controllerTest = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(title: const Text("Mon profil"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.purple, border: Border.all(color: Colors.black, width: 3)),
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child:
                  Text("name : $name prenom : $prenom\n", style: TextStyle(fontSize: 30),)
                  ,)
              ],
            ),
            Container(margin: EdgeInsets.all(5),alignment: Alignment.center,
              child: MainTitleText(data: "Modifier les infos",),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                  child:                 TextField(
                    controller: controllerName,
                    decoration: InputDecoration(hintText: "Nom", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    onChanged: (newString) {setState(() {
                      name = newString;
                    });},
                  ),),
                Padding(padding: EdgeInsets.all(10),
                  child:                TextField(
                    controller: controllerSurname,
                    decoration: InputDecoration(hintText: "Prénom", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    onChanged: (newString) {setState(() {
                      prenom = newString;
                    });},
                  ),),
                userInfos(controllerSecret, "Entrez votre phrase secrète", true, secret),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Genre féminin"),
                    Switch(value: switchGenderValue, onChanged: ((newValue) { setState(() { switchGenderValue = newValue;});
                    }))

                  ],
                ),
              ],
            ),
          ],
        ),)
      ,
    );
  }
}

Column userInfos (TextEditingController controller, String text, bool password, String cache) {
  return Column(
    children: [
      TextField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(hintText: text),
      )],
  );

    /*Column(
    children: [
      TextField(
        obscureText: password,
        controller: controller,
        decoration: InputDecoration(hintText: text),
        onChanged: (newString) {
          //setState(() {
            //prenom = newString;

        }
        ,)
    ],
  );*/

}
