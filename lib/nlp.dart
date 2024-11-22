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
class nlp extends StatefulWidget {
  const nlp({Key? key}) : super(key: key);

  @override
  State<nlp> createState() => _nlpState();
}

class _nlpState extends State<nlp> {
  final Itext=TextEditingController();
  void dispose(){
    Itext.dispose();
    super.dispose();
  }
  String summ="Powered by Natural Language Processing.";
  var url;
  var data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: PreferredSize(
        preferredSize: Size.fromHeight(25.0),
        child: AppBar(title: Text('Notes Summary'),
        ),
      ),
      body: Container(child: Column(children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: TextField(
          //controller: Itext,
          onChanged: (value){
            //url='http://127.0.0.1:5000/api?query=' + value.toString();
            url='http://abdulbasitbhat.pythonanywhere.com/api?query=' + value.toString();
            //This is for trial. It will only give 100s daily usage.
          },
          decoration: InputDecoration(
            labelText: 'Enter Text',
            helperText: 'Works Accurately With large Input Size',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black38, width: 1.0),
            )
          ),
        ),
        ),
        Container(child: ElevatedButton(child: Text('Get Summary'),
        onPressed: () async{
          
          data=await getdatasumm(url);
          var decoded=jsonDecode(data);
          
          setState(() {
            summ=decoded['output'];
            
          });
            
           /* final tex=Itext.toString();
            final url='http://127.0.0.1:5000/api?query' + tex;
            final response = await http.get(Uri.parse(url));
            final d= json.decode(response.body) as Map<String,dynamic>;
            print(d['output']);*/
            
        },
        ),
        ),
        Container(
          margin:EdgeInsets.all(20),
          padding:EdgeInsets.all(20),
          child:SelectableText(summ),
          )
    
      ]),),
      ),
    );
    
    
  }
}