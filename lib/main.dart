import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';

//Initialiing app with Firebase as backend
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: FirebaseOptions(
      //apiKey: "AIzaSyDhZ8_EeyibfHGywJllD4tFWaXj6hVDhtI",
      //appId: "1:347438100726:web:9c8307d1b16fb42df27cd7",
      //messagingSenderId: "347438100726",
      //projectId: "tietg-a5276",
    //),
  );
  runApp(MyApp());
}

/*void main(){
  runApp(MyApp());
}*/

//Create app as Stateful and call loginWidget as Stateful
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) { 
    return LoginWidget();
  }
}



class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  var buttonName = 'Login';
  var buttonName2 = 'Sign Up';
  final emailController=TextEditingController();
  final passController=TextEditingController();
  @override
  void dispose(){
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    //StreamBuilder is a widget that builds itself based on the latest snapshot of interaction with a stream.
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          //If already logged in
          return Home();
            
        }
        else{
          //Sign in
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Container(
            margin:const EdgeInsets.all(0),
            
            child: Scaffold(
            backgroundColor: Color.fromARGB(255, 248, 245, 245),
            appBar: AppBar(
              title: const Center(
                child: Text('TietGram'),
              ),
            ),
    
          body: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                margin: const EdgeInsets.all(20),
                child:  Center(child: TextField(controller: emailController,
                decoration: InputDecoration(border: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 72, 77, 217),width:2.0),
                ), helperText: 'User Name'),)), 
              ),
              
               Container(
                margin: const EdgeInsets.all(20),
                child: Center(child: TextField(controller: passController,
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 72, 77, 217) ,width:2.0),
                ), helperText: 'Password'),))
              ),
               
               Container(
                margin: const EdgeInsets.all(10),
                child: Center(child: 
                //A builder is a Flutter design pattern in which the construction code of a widget is defined outside of its class. 
                Builder(
                  builder: (context) {
                    return ElevatedButton(onPressed: signIn
                    /*(){
                       /* Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                          return Home();
                         },
                         ),
                        );*/
                        //signIn();
                    }*/
                     , child: Text(buttonName)
                      
                     );
                  }
                )
                 )
              ),
                 

                 //Not a user. SignUp. Jump to Signup Page
                 Container(
                  margin: const EdgeInsets.all(10),
                  child: Center(child: 
                  Builder(
                    builder: (context) {
                      return ElevatedButton(onPressed: (){
                        //To switch to a new route, use the Navigator.push() method. The push() method adds a Route to the stack of routes managed by the Navigator .
                        //It switches to a new page, we can go back to prev pate using Navigator.pop()
                        //BuildContext is a locator that is used to track each widget in a tree and locate them and their position in the tree
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                        return Signup() ;
                      }
                      ),
                      );
                 },child: Text(buttonName2));
                    }
                  )
                  ),
                 ),


                 //Work on Forget Password .......
                 Container(child: Center(
                   child: Builder(
                     builder: (context) {
                       return ElevatedButton(
                        child: Text('Forgot Password?'),
                        onPressed: (){},
                       );
                     }
                   ),
                 ))
             ],
    
             
           ),
           ),
          ), 
          ) 
        );
        }
      }
    );
  }

  
}