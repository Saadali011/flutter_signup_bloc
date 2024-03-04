

import 'package:bloctest/sign_in/bloc/sign_in_event.dart';
import 'package:bloctest/sign_in/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc() : super(SignInInitialState()){

    on<SignInTextChangedEvent>((event, emit){
      if(EmailValidator.validate(event.emailValue) == false){
        emit(SignInErrorState("Please enter a valid email address")
        );
      }
      else if(event.passwordValue.length < 8 ){
        emit(SignInErrorState("Please enter a valid password"));
      }
      else{
        emit(SignInInvalidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}

