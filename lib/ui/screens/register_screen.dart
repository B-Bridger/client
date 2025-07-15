import 'package:client/providers/register_provider.dart';
import 'package:client/ui/screens/home_screen.dart';
import 'package:client/ui/screens/login_screen.dart';
import 'package:client/utils/http/api/user.dart';
import 'package:client/utils/http/model/response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// TODO: 반응형 지원 필요
class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      context.read<RegisterProvider>().updateEmail(_emailController.text);
    });
    _nameController.addListener(() {
      context.read<RegisterProvider>().updateName(_nameController.text);
    });
    _passwordController.addListener(() {
      context.read<RegisterProvider>().updatePassword(_passwordController.text);
    });
    _passwordConfirmController.addListener(() {
      context.read<RegisterProvider>().updatePasswordConfirm(
        _passwordConfirmController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 33, 65),
      body: Row(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/auth_background.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 350,
            color: Color(0xFF202124),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png", height: 200),
                  ],
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "이메일",
                    fillColor: Color.fromARGB(255, 53, 54, 58),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: "이름",
                    fillColor: Color.fromARGB(255, 53, 54, 58),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "비밀번호",
                    fillColor: Color.fromARGB(255, 53, 54, 58),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                    hintText: "비밀번호 재입력",
                    fillColor: Color.fromARGB(255, 53, 54, 58),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 50),
                Consumer<RegisterProvider>(
                  builder: (context, provider, child) {
                    return ElevatedButton(
                      onPressed: provider.isValid
                          ? () async {
                              ResponseWithUser result = await register(
                                provider.email,
                                provider.name,
                                provider.password,
                              );

                              switch (result.statusCode) {
                                case 201:
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                  break;

                                // TODO: 회원가입 실패 Dialog 처리
                                case 400:
                                case 409:
                                case 500:
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: provider.isValid
                            ? Color.fromARGB(255, 116, 213, 255)
                            : Color.fromARGB(255, 53, 54, 58),
                        minimumSize: Size(double.infinity, 48),
                      ),
                      child: Text(
                        "시작하기",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Divider(color: Colors.white, thickness: 0.8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "이미 계정이 있으신가요?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text("로그인"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
