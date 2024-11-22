/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tietgram/getData.dart';


class blog extends StatefulWidget {
  const blog({Key? key}) : super(key: key);

  @override
  State<blog> createState() => _blogState();
}


class _blogState extends State<blog> {

  List<String> postIDs=[];
  late String id='';

  //get docIDs
  Future getpostIDs() async{
    await FirebaseFirestore.instance.collection('blogs').orderBy("date-time", descending: true).get().then((snapshot) => snapshot.docs.forEach((document){
      print(document.reference);
      postIDs.add(document.reference.id);
      //Username.add(document.reference.name);
    },
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Center(
              child: Text('Blogs'),
              ),
              
              ),
               preferredSize: Size.fromHeight(25),
        ),
            body: Column(
              children: [
                Expanded(
                    child: FutureBuilder(
                      future: getpostIDs(),
                      builder: (context,snapshot){
                      return ListView.builder(
                      itemCount: postIDs.length,
                      itemBuilder: (context,index){
                        
                      return ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(218, 228, 228, 229),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          padding:EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          //color: Color.fromARGB(255, 38, 189, 235),
                          child:getFeedblogs(postIDss:postIDs[index]),),   //For displaying all users
                        //title:getUsername(documentId:FirebaseAuth.instance.currentUser!.uid,)
                      );
                        
                        
                    }
                    );
                    }
                    ),
                  )
                /*Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        //Text('Feed 1'),
                        Image.network('https://firebasestorage.googleapis.com/v0/b/tietg-a5276.appspot.com/o/Images%2Fscaled_image_picker321585397062839579.jpg?alt=media&token=b07160f4-6864-49fe-a59f-0ec9d4f39953'),
                        Text('Feed 2'),
                      ],
                      ),
                  )
                ),*/
              ],
            ),
        ),
    );
  }
}

*/