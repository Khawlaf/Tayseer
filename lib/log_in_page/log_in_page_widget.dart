import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInPageWidget extends StatefulWidget {
  const LogInPageWidget({Key key}) : super(key: key);

  @override
  _LogInPageWidgetState createState() => _LogInPageWidgetState();
}

class _LogInPageWidgetState extends State<LogInPageWidget> {
   TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController driverIDController = new TextEditingController();
  bool passwordVisibility=false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //textController1 = TextEditingController();
    //textController2 = TextEditingController();
    passwordVisibility = false;
  }
/* progressDialogue(BuildContext context) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () {}, child: alert);
      },
    );
  }

  _logIn() async {
    progressDialogue(context);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: passIDController.text,
          password: passPasswordController.text);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => WelcomePageWidget()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      var message = '';
      switch (e.code) {
        case 'invalid-email':
          message = 'invalid email';
          break;
        case 'user-disabled':
          message = 'the user is disabeld';
          break;
        case 'user-not-found':
          message = 'user not found';
          break;
        case 'wrong-password':
          message = 'incorrect password';
          break;
             case 'too-many-requests':
          message =
              'user blocked for sometime due to many wrong attempts.Try again later';
          break;
      }
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Log in failed'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ok')),
              ],
            );
          });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF85BBC2),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 130, 0, 0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFFD8EBEE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Image.asset(
                    'assets/images/WhatsApp_Image_2022-01-24_at_5.31.50_PM.jpeg',
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(195, 30, 0, 0),
                  child: Text(
                    '*رقم الهوية/الإقامة',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Noto Sans',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: driverIDController,
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFA6C9CF),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Noto Sans',
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'الرجاء  ادخال رقم الهويه/الإقامة';
                      }
                      if (val.length < 10) {
                        return 'الرجاء  ادخال رقم صحيح';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(250, 30, 0, 0),
                  child: Text(
                    '*كلمة السر',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Noto Sans',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 10,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Color(0xFFA6C9CF),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility = !passwordVisibility,
                        ),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Noto Sans',
                    ),
                    textAlign: TextAlign.end,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'الرجاء  ادخال رقم الهويه/الإقامة';
                      }
                      if (val.length < 10) {
                        return 'الرجاء  ادخال رقم صحيح';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: FFButtonWidget(
                    onPressed: ()async {
                      final String DriverID =passIDController.text.trim();
                      final String Password=passPasswordController.text.trim();

                      if(DriverID.isEmpty){
                        print("الرجاء إادخال رقم الهوية/الإقامة")
                      }
                       if(Password.isEmpty){
                        print("الرجاء إدخال كلمةالسر")
                      }
                      else{
                         QuerySnapshot snap = await FirebaseFirestore.instance.collection(Car_driver)
                        .where("DriverID",isEqualTo: DriverID).get();
                           context.read<AuthService>().login(
                        snap.docs[0]['email'],
                        password,
                      );
                      }
                    },
                    text: 'تسجيل الدخول',
                    options: FFButtonOptions(
                      width: 200,
                      height: 50,
                      color: Color(0xFF85BBC2),
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
