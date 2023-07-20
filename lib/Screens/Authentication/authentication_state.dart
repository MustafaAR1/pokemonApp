// Authentication State
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String errorMessage;

  AuthenticationFailure(this.errorMessage);
}
