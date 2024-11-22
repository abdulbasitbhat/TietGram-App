import 'dart:convert';
import 'nlpfunc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tietgram/nlpfunc.dart';

/*
void main(){
   runApp(nlp());
}
*/
class ml_sp extends StatefulWidget {
  const ml_sp({Key? key}) : super(key: key);

  @override
  State<ml_sp> createState() => _ml_spState();
}

class _ml_spState extends State<ml_sp> {
  final Ctext1=TextEditingController();
  final Ctext2=TextEditingController();
  final Ctext3=TextEditingController();
  final Ctext4=TextEditingController();
  final Ctext5=TextEditingController();
  final Ltext=TextEditingController();
  final stext=TextEditingController();

  var studytimeM;
  var studytimeT;
  var studytimeW;
  var studytimeTh;
  var studytimeFr;
  void dispose(){
    Ctext1.dispose();
    Ctext2.dispose();
    Ctext3.dispose();
    Ctext4.dispose();
    Ctext5.dispose();
    Ltext.dispose();
    stext.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: AppBar(title: Text('Study Planner'),
              ),
        ),
      
      body: Center(
        child: SingleChildScrollView(
          child: Container(child: Column(children: [
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ctext1,
              decoration: InputDecoration(
                labelText: 'Enter No Of Classes Today',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ctext2,
              decoration: InputDecoration(
                labelText: 'Enter Classes on Tuesday',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ctext3,
              decoration: InputDecoration(
                labelText: 'Enter Classes on Wednesday',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ctext4,
              decoration: InputDecoration(
                labelText: 'Enter Classes on Thursday',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ctext5,
              decoration: InputDecoration(
                labelText: 'Enter Classes on Friday',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:Ltext,
              decoration: InputDecoration(
                //helperText: 'Enter Average Leasure Time',
                labelText: 'Enter Average Leasure Time',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(2),
              child: TextField(
              controller:stext,
              decoration: InputDecoration(
                labelText: 'Enter Average Sleep Time',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black38, width: 1.0),
                )
              ),
            ),
            ),
            Container(child: ElevatedButton(child: Text('Predict'),
            onPressed: () async{
              if( studytimeM != Null && studytimeT != Null && studytimeW != Null && studytimeTh != Null && studytimeFr != Null){
              studytimeM= 11.9912 - 0.6082 * double.parse(Ctext1.text) -0.4999* double.parse(Ltext.text) -0.496 * double.parse(stext.text);
              studytimeT= 11.9912 - 0.6082 * double.parse(Ctext2.text) -0.4999* double.parse(Ltext.text) -0.496 * double.parse(stext.text);
              studytimeW= 11.9912 - 0.6082 * double.parse(Ctext3.text) -0.4999* double.parse(Ltext.text) -0.496 * double.parse(stext.text);
              studytimeTh= 11.9912 - 0.6082 * double.parse(Ctext4.text) -0.4999* double.parse(Ltext.text) -0.496 * double.parse(stext.text);
              studytimeFr= 11.9912 - 0.6082 * double.parse(Ctext5.text) -0.4999* double.parse(Ltext.text) -0.496 * double.parse(stext.text);

              
              }
              setState(() {
                studytimeM=studytimeM.toStringAsFixed(2);
                studytimeT=studytimeT.toStringAsFixed(2);
                studytimeW=studytimeW.toStringAsFixed(2);
                studytimeTh=studytimeTh.toStringAsFixed(2);
                studytimeFr=studytimeFr.toStringAsFixed(2);
              });
            },
            ),
            ),
            Container(
              margin:EdgeInsets.all(5),
              padding:EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(218, 228, 228, 229),
                    borderRadius: BorderRadius.all(Radius.circular(10)
                    ),
                  ),
                child: Column(
                  
                  children: [
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Self Study Time on Monday (in hrs): ' + studytimeM.toString())),
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Self Study Time on Tuesday: (in hrs): ' + studytimeT.toString())),
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Self Study Time on Wednesday: (in hrs): ' + studytimeW.toString())),
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Self Study Time on Thursday: (in hrs): ' + studytimeTh.toString())),
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Self Study Time on Friday: (in hrs): ' + studytimeFr.toString())),
                    Container(
                      margin:EdgeInsets.all(5),
                      padding:EdgeInsets.all(5),
                      child: Text('Powered by Machine Learning Algorithms. \nEach class is assumed to be of 50 mins. For labs double the count')),
                  ],
                )
                )
              )
            
            
          ]),),
        ),
      ),
      ),
    );
  }
}