import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FocusNode _uidFocusNote = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _uidFocusNote.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex:1,
                            child: Image.asset(
                              'assets/firebase_logo.png',
                              height: 100,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'FlutterFireBase',
                            style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            'CRUD',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (context, snapshot){
                        if(snapshot.hasError){
                          return Text("Error Initaliezing Firebase");
                        }else if(snapshot.connectionState == ConnectionState.done){
                          return LoginForm(focusNode: _uidFocusNote);
                        }
                        return CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
