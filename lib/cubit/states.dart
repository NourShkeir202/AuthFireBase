abstract class LoginAuthStates {}

class LoginAuthInitialStates extends LoginAuthStates {}

class LoginAuthSuccessStates extends LoginAuthStates {}

class LoginAuthLoadingStates extends LoginAuthStates {}

class LoginAuthErrorStates extends LoginAuthStates {
  final String error;
  LoginAuthErrorStates(this.error);
}

class LoginChangePasswordVisibilityState extends LoginAuthStates {}
