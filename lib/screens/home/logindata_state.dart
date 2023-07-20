part of 'logindata_cubit.dart';


class LoginDataState extends Equatable{
    bool isLogin;
    String message;
    TextEditingController username;
    TextEditingController password;

   LoginDataState({required this.isLogin,required this.message,required this.password,required this.username});
  List<Object?> get props =>[isLogin,message];

    LoginDataState copyWith({
    bool? isLogin,
    String? message,
    TextEditingController? username,
    TextEditingController? password,
  }) {
    return LoginDataState(
      isLogin: isLogin ?? this.isLogin,
      message: message ?? this.message,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

}
