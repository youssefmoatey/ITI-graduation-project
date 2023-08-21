import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/HomeScreen.dart';
import 'package:flutter_application_5/screens/Signup.dart';
import 'package:flutter_application_5/widgets/custom_buttom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, toolbarHeight: 30,),
      body: 
      Form(key: _formKey,
      child: Padding(
        padding:  EdgeInsets.all(16.0),
              child: SingleChildScrollView(
               child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding( padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                  validator: (value) {
                    if(value == null || value.contains("@") == false){
                      return " Enter valid Email ";
                    }
                  }, 
                ),
             ),
              Padding(
               padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ),
                  validator: (value ){
                    if( value == null || value.length < 8){
                      return " Enter valid Password ";
                    }
                  },
                ),
              ),

              SizedBox(height: 18.0),
             MyCustomButton(
              buttonLabel: "Sign in",   
                   onTap: () async {
                  bool result = await  fireBaseLogin(emailcontroller.text, passwordcontroller.text);
                  if(result == true) {
                   if (_formKey.currentState!.validate()) {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setString('email', emailcontroller.text);

                         Navigator.push(
                               context,
                             MaterialPageRoute(
                              builder: (context) =>  HomeScreen(
                              email: emailcontroller.text,
                             )),
                                  );
                   } 
                      } else {ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('Sign in Failed')),
                          );}
                       
                      },
                    ),

                    Center(
                      child: Text("Forgot Password? Tap me.",
                      style: TextStyle(color: Colors.blueAccent,fontSize: 20), 
                      ),
                       ),

             SizedBox(height: 18.0),
             MyCustomButton(
              buttonLabel: " No account?Sign up",   
                   onTap: () async {
                   if (_formKey.currentState!.validate()) {
                         Navigator.push(
                               context,
                             MaterialPageRoute(
                              builder: (context) => SignUp()),
                                  );
                          } 
                      },
                    ),
                   
                       ],
                       ),
              ),
          ),
      ),
    );
  }

    Future<bool> fireBaseLogin(String email, String password) async {
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  if(userCredential.user != null) {
    return true;
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  }
      return false;
 }
}



          /* Padding(
                    padding: const EdgeInsets.all(8.0),
                     child: Container(
                     width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                            ),
                          child: Center(
                              child: Text("No Account?Sign Up",
                              style: TextStyle(color: Colors.black,
                              fontSize: 20),
                              ),
                              ),
                       ),
                 ),*/