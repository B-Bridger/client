import 'package:client/providers/login_provider.dart';
import 'package:client/ui/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// TODO: 반응형 지원 필요
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      context.read<LoginProvider>().updateEmail(_emailController.text);
    });
    _passwordController.addListener(() {
      context.read<LoginProvider>().updatePassword(_passwordController.text);
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
                    Image.asset("assets/images/logo.png", height: 300),
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
                SizedBox(height: 50),

                Consumer<LoginProvider>(
                  builder: (context, provider, child) {
                    return ElevatedButton(
                      onPressed: provider.isValid
                          ? () {
                              // TODO: 로그인 로직 구현 필요
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
                      child: Text("다음", style: TextStyle(color: Colors.white)),
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
                    Text("계정이 없으신가요?", style: TextStyle(color: Colors.white70)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text("회원가입"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "도움이 필요하신가요?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: 문의 페이지 이동
                      },
                      child: Text("문의하기"),
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
