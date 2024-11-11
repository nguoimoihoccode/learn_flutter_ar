// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginLoading();
      await Future.delayed(Duration(seconds: 2)); // Giả lập xử lý login
      
      if (event.email == "admin" && event.password == "admin") {
        yield LoginSuccess();
      } else {
        yield LoginFailure("Sai email hoặc mật khẩu");
      }
    }
  }
}
