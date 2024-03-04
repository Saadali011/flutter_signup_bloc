import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloctest/sign_in/SignIn.dart';
import 'package:bloctest/sign_in/bloc/sign_in_bloc.dart';
import 'package:bloctest/ui_helper/utill.dart';
import 'package:bloctest/widget/rounded_btn.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome",
                  style: mTextStyle16(),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 11),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        RoundedButton(
                          btnName: "LOG IN",
                          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          styleForm: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => SignInBloc(),
                                  child: SignInScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      RoundedButton(
                        btnName: "Sign In With Email",
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        styleForm: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => SignInBloc(),
                                child: SignInScreen(),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 11),
                      RoundedButton(
                        btnName: "Sign In With Google",
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        styleForm: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 93, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        isEnabled: false, // Set to false to disable the button
                        callback: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
