import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tietgram/getData.dart';
import 'details.dart';
import 'upload.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _homepageState();
}


class _homepageState extends State<Homepage> {

String uidd= FirebaseAuth.instance.currentUser!.uid.toString();
late dynamic userData= FirebaseFirestore.instance.collection("Users").doc(uidd.toString()).get();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              title: const Center(
                child: Text('Home')
                ),
            ),
             preferredSize: Size.fromHeight(25),
          ),
            body: Center(
              child: Column(
                children: [
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child:Column(
                              children: [
                                //Text('ID'),

                                Container(
                              
                                  decoration: BoxDecoration(
                                  color: Color.fromARGB(218, 228, 228, 229),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding:EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                                  child: Text("ID = " + FirebaseAuth.instance.currentUser!.uid)),
                              ],
                            ),
                          ),
                                 
                                 
                     
                        ],
                      )
                     ),
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          
                          children: [
                            
                              Container(
                                decoration: BoxDecoration(
                            color: Color.fromARGB(218, 228, 228, 229),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding:EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                              
                              child: Text("Email = " + FirebaseAuth.instance.currentUser!.email.toString()
                              )
                              ),
                        
                              //alignment: Alignment.bottomRight,
                               Container(
                                margin:EdgeInsets.fromLTRB(0, 70, 0, 0),
                                     child: Align(
                                      //alignment: Alignment.bottomRight,
                                       child: ElevatedButton(
                                        onPressed: (){
                                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                                             {
                                                     return UploadPage();
                                             }
                                             )
                                             );
                                                     },
                                               child: Text('Upload'),
                                           ),
                                     )
                                       ),
                             
                            /* Container(
                              margin: EdgeInsets.all(10),
                              child: Center(child: 
                              FutureBuilder(builder: (context,snapshot){
                                return ListTile(
                                  title: Column(
                                    children: [
                                      if(getUsername(documentId:FirebaseAuth.instance.currentUser!.uid)!=Null)...[
                                      Center(child: getUsername(documentId:FirebaseAuth.instance.currentUser!.uid ,)),]
                                      else...[
                                        Center(child: Text('Please Enter Data in Settings'),)
                                      ]

                                    ],
                                  ),
                                  
                                );
                              },))
                             ),*/
                        ],
                        ),
                      ),
                     ),
                    /* Container(
                      margin: EdgeInsets.all(10),
                      child: Text('Bio Here')
                     ),
                     Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [

                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Followers Here')
                              ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text('Folllowing Here')
                              ),
                          ],
                        ),
                      )
                     ),*/

                ]
                ),
            ),
          )
    );
  }
}

/*
class displatData extends StatelessWidget {
  
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Details,
      builder: 
      )



    /*if(getUsername(documentId:FirebaseAuth.instance.currentUser!.uid) != Null){
      return Center(child: getUsername(documentId:FirebaseAuth.instance.currentUser!.uid));
    }
    else{
      return Text('Please Enter Data in Settings');
    }*/
  }
}*/