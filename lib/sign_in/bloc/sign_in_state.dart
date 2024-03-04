abstract class SignInState{}

class SignInInitialState extends SignInState{}
class SignInInvalidState extends SignInState{}
class SingInValidState extends SignInState{}
class SignInErrorState extends SignInState{
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}
class SignInLoadingState extends SignInState{
}