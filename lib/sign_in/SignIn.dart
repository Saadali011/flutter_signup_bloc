import 'package:bloctest/sign_in/bloc/sign_in_event.dart';
import 'package:bloctest/sign_in/bloc/sign_in_state.dart';
import 'package:bloctest/ui_helper/utill.dart';
import 'package:bloctest/widget/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign In With Email",
            style: appBarheading(),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              children: [

                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      );
                    }
                    else {
                      return Container();
                    }
                  },
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: emailController,
                  onChanged: (val){
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(emailController.text, passwordController.text)
                    );
                  },
                  decoration: InputDecoration(
                      hintText: "Email Address"
                  ),
                ),

                SizedBox(height: 11,),

                TextField(
                  controller: passwordController,
                  onChanged: (val){
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(emailController.text, passwordController.text)
                    );
                  },
                  decoration: InputDecoration(
                      hintText: "Email Address"
                  ),
                ),

                SizedBox(height: 11,),

                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if(state is SignInLoadingState){
                      return Center(child: CircularProgressIndicator(
                        color: Colors.blue,
                      ));
                    }
                    return RoundedButton(
                      bgColor: (state is SignInInvalidState) ? Colors.blue : Colors.grey,
                      styleForm: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 93, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      callback: (){
                        if(state is SignInInvalidState){
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(emailController.text, passwordController.text)
                          );
                        }
                      },
                      btnName: ("Sign In"),
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }

}