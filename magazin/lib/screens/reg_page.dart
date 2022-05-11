import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:magazin/api/api.dart';
import 'package:magazin/models/users.dart';
import 'package:magazin/widgets/main_frame.dart';
import 'package:magazin/widgets/passwordField.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _password = '';

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background/watercolor.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFAB3FF),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  style: GoogleFonts.lobster(fontSize: 18),
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.roboto(fontSize: 18),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.person,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                      labelText: 'Никнейм',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFAB3FF),
                  //E667AF
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  style: GoogleFonts.lobster(fontSize: 18),
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelStyle: GoogleFonts.roboto(fontSize: 18),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.alternate_email,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                      labelText: 'Email',
                      hintText: 'abc@gmail.com',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                isReg: true,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 35,
              ),
              OutlinedButton(
                onPressed: () {
                  Api().registration(
                    Users(
                      login: _emailController.text,
                      email: _emailController.text,
                      password: _password,
                    ),
                  );
                },
                child: Text('Зарегистрироваться'),
              )
            ],
          ),
        ),
      ),
      //   ),
      // ),
      // SizedBox(
      //   height: 15,
      // ),
      // Container(
      //   height: 50,
      //   width: 250,
      //   decoration: BoxDecoration(
      //       color: Color(0xFF89628C),
      //       borderRadius: BorderRadius.circular(20)),
      //   child: FlatButton(
      //     onPressed: () async {
      //   bool reg = await TableModule().registerUser(
      //       _loginController.text,
      //       _emailController.text,
      //       _password,
      //       isSmall,
      //       context);
      //   if (reg == true)
      //     return showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           elevation: 3.0,
      //           backgroundColor: Color(0xFFFAB3FF),
      //           content: Container(
      //             height: 120,
      //             width: 250,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Container(
      //                   height: 85,
      //                   width: 85,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                         color: Colors.indigo,
      //                         width: 2.0,
      //                         style: BorderStyle.solid),
      //                     borderRadius: BorderRadius.circular(90.0),
      //                     image: const DecorationImage(
      //                       image: ExactAssetImage(
      //                           'assets/successful.jpg'),
      //                       fit: BoxFit.cover,
      //                     ),
      //                   ),
      //                 ),
      //                 Text(
      //                   'Вы успешно зарегистрировались',
      //                   style: TextStyle(
      //                     fontSize: 15,
      //                     fontWeight: FontWeight.w800,
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      // },
      //     child: Text(
      //      'Регистрация',
      //      style: TextStyle(color: Colors.white, fontSize: 25),
      //    ),
      //   ),
      //  ),
      //   Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('У меня уже есть аккаунт'),
      //       FlatButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           child: Text(
      //             'На страницу авторизации',
      //             style: TextStyle(
      //                 color: Colors.blue[700],
      //                 fontSize: 15,
      //                 fontWeight: FontWeight.bold),
      //           )),
      //     ],
      //   )
      // ],
      // ),
    );
  }
}
